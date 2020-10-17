#include "accelPlatform.hpp"
#include <ctime>

// Utilities
template <typename T, int size>
std::vector<T> dot_cpu (const std::array<std::array<T, size>, size> &mat , const std::vector<T> &vec)
{
    std::vector<T> result { };
    T val { };
    for (auto i = 0; i < size; i++) {
        val = 0;
        for (auto j = 0; j < size; j++) {
            val += mat[i][j] * vec[j];
        }
        result.push_back(val);
    }
    return result;
}

// Print Functions
template <typename T>
void print_vector (std::vector<T> &v)
{
    for (const auto &it: v)
        std::cout << it << " ";
    std::cout << std::endl;
}

template <class T, int size>
void print_array (std::array<std::array<T, size>, size> &c)
{
    for (auto i = 0; i < size; i++) {
        for (auto j = 0; j < size; j++) {
            std::cout << "[" << i  << "]" << "[" << j  <<"] = " << c[i][j] << " ";
        }
        std::cout << '\n';
    }
    std::cout << '\n';
}

// New function to capture the time of the OpenCL commands
uint64_t get_duration_ns (const cl::Event &event) {
    uint64_t nstimestart, nstimeend;
    event.getProfilingInfo<uint64_t>(CL_PROFILING_COMMAND_START, &nstimestart);
    event.getProfilingInfo<uint64_t>(CL_PROFILING_COMMAND_END, &nstimeend);
    return (nstimeend-nstimestart);
}
/********************************************************************************/

int main (int argc, char** argv)
{
    // Parse the arguments
    std::string fpgaFile = (argc != 2) ? "default.aocx" : argv[1];

    // Call the setup class constructor
    cl_int err;
    accelPlatfom fpga (fpgaFile);

    /* Configure the entire OpenCL accelerator environment.
     * The constructor returns the context, program and
     * command queue in that specific order. */
    cl::Context context;
    cl::Program program;
    cl::CommandQueue q;
    std::tie(context, program, q) = fpga.setupAccelerator();

    /* The OpenCL device is configured and ready to
     * receive/send commands from/to the queue
     * (aka the user's code).
     * Create your code to interact with the
     * accelerator from here. */
    cl::Kernel accel_app (program, "matvec_mult", &err);

    // Create buffers and arguments
    std::vector<float> dot {0.0, 3.0, 6.0, 9.0};
    std::vector<float> m {0.0, 2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0, 18.0, 20.0, 22.0, 24.0, 26.0, 28.0, 30.0};

    cl::Buffer m_buf    (context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY, sizeof(float)  * 16, NULL, &err);
    cl::Buffer dot_buf  (context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY, sizeof(float)  *  4, NULL, &err);
    cl::Buffer res_buf  (context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_WRITE_ONLY, sizeof(float) *  4, NULL, &err);

    accel_app.setArg (0, m_buf);
    accel_app.setArg (1, dot_buf);
    accel_app.setArg (2, res_buf);

    // Map host-side buffer to user-space pointers
    auto *m_fpga   = (float *) q.enqueueMapBuffer (m_buf,   CL_TRUE, CL_MAP_WRITE, 0, sizeof(float) * 16);
    auto *dot_fpga = (float *) q.enqueueMapBuffer (dot_buf, CL_TRUE, CL_MAP_WRITE, 0, sizeof(float) * 4);
    auto *res_fpga = (float *) q.enqueueMapBuffer (res_buf, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(float) * 4);

    // Filling the test vectors
    for (auto i = 0; i < 4; i++) {
        dot_fpga[i] = dot[i];
        res_fpga[i] = 0;
    }

    for (auto j = 0; j < 16; j++)
        m_fpga[j] = m[j];
    
    // Execute the kernel
    accel_app.setArg(0, m_buf);
    accel_app.setArg(1, dot_buf);
    accel_app.setArg(2, res_buf);

    // Profiling OpenCL execution
    cl::Event event;
    uint64_t duration = 0;

    // Get the results
    q.enqueueMigrateMemObjects({m_buf, dot_buf}, 0);
    q.enqueueTask(accel_app, NULL, &event);
    q.enqueueMigrateMemObjects({res_buf}, CL_MIGRATE_MEM_OBJECT_HOST);
#ifdef __NDRANGE__
    q.enqueueNDRangeKernel(accel_app, cl::NullRange, cl::NDRange(4), cl::NullRange);
    q.enqueueReadBuffer(res_buf, CL_TRUE, 0, sizeof(float) * 4, res_fpga);
#endif
    // Wait for all scheduled operations to finish
    q.finish();
    duration = get_duration_ns (event);

    // CPU calculation
    std::array<std::array<double, 4>, 4> mat {{
        {{ 0.0,  2.0,  4.0,  6.0}},
        {{ 8.0, 10.0, 12.0, 14.0}},
        {{16.0, 18.0, 20.0, 22.0}},
        {{24.0, 26.0, 28.0, 30.0}}
    }};
    std::vector<double> v { };

    for (auto i = 0; i < 4; i++)
        v.push_back(i*3.0);

    // Get CPU wall clock
    std::vector<double> dot_cpu_res { };
    std::clock_t start = std::clock();
    dot_cpu_res = dot_cpu<double, 4> (mat, v);
    std::clock_t end = std::clock();
    long double time_elapsed_ns = (1000000.0)*(1000.0 * (end-start) / CLOCKS_PER_SEC);

    // Results
    std::cout << "Checking results CPU vs FPGA\n";
    int error {0};
    for (auto k = 0; k < 4; k++) {
        if (dot_cpu_res[k] != res_fpga[k]) {
            std::cout << "Error index " << k << " : " << res_fpga[k] << " vs " << dot_cpu_res[k] << '\n';
            error++;
        }
    }
    std::cout << "***** RESULTS *****\n";
    std::cout << "ERRORs: " << error << '\n';
    std::cout << "Kernel compute execution (in ns) = " << duration << '\n';
    std::cout << "CPU compute execution (in ns) = " << time_elapsed_ns << '\n';
}
