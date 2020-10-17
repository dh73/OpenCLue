#include "accelPlatform.hpp"
#include <ctime>

// Utils
template <typename T>
void print_vector (std::vector<T> &v)
{
    for (const auto &it: v)
        std::cout << it << " ";
    std::cout << std::endl;
}

// New function to capture the time of the OpenCL commands
uint64_t get_duration_ns (const cl::Event &event) {
    uint64_t nstimestart, nstimeend;
    event.getProfilingInfo<uint64_t>(CL_PROFILING_COMMAND_START, &nstimestart);
    event.getProfilingInfo<uint64_t>(CL_PROFILING_COMMAND_END, &nstimeend);
    return (nstimeend-nstimestart);
}

int main (int argc, char** argv)
{
    // Parse the arguments
    std::string fpgaFile = (argc != 2) ? "vector_scale.xclbin" : argv[1];

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
    cl::Kernel accel_app (program, "vector_scale", &err);

    // Create buffers and arguments
    std::vector<float> argx { };
    std::vector<float> argy { };

    for (auto i = 0; i < 16; i++) {
        argx.push_back(i * 3.0f);
        argy.push_back(0);
    }

    // Debug: Print both argx and argy
    std::cout << "\tVector x is: \n";
    print_vector<float> (argx);
    std::cout << "\tVector y is: \n";
    print_vector<float> (argy);

    // CPU results
    std::vector<float> cpu_results { };
    float tmp { };
    std::clock_t start = std::clock();
    for (auto i = 0; i < 16; i++) {
        tmp = argx[i] * 5;
        cpu_results.push_back(tmp);
    }
    std::clock_t end = std::clock();
    long double time_elapsed_ns = (1000000.0)*(1000.0 * (end-start) / CLOCKS_PER_SEC);

    // Create buffers
    cl::Buffer argx_buf (context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY,  sizeof(float) * 16, NULL, &err);
    cl::Buffer argy_buf (context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_WRITE_ONLY, sizeof(float) * 16, NULL, &err);

    accel_app.setArg (0, argx_buf);
    accel_app.setArg (1, argy_buf);

    // Map host-side buffer to user-space pointers
    auto *x_fpga   = (float *) q.enqueueMapBuffer (argx_buf, CL_TRUE, CL_MAP_WRITE, 0, sizeof(float) * 16);
    auto *y_fpga   = (float *) q.enqueueMapBuffer (argy_buf, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(float) * 16);

    // Filling the test vectors
    for (auto i = 0; i < 16; i++) {
        x_fpga[i] = argx[i];
        y_fpga[i] = 0;
    }

    // Execute the kernel
    accel_app.setArg (0, argx_buf);
    accel_app.setArg (1, argy_buf);

    // Profiling OpenCL execution
    cl::Event event;
    uint64_t duration = 0;

    // Get the results
    q.enqueueMigrateMemObjects({argx_buf}, 0);
    q.enqueueTask(accel_app, NULL, &event);
    q.enqueueMigrateMemObjects({argy_buf}, CL_MIGRATE_MEM_OBJECT_HOST);
#ifdef __NDRANGE__
    q.enqueueNDRangeKernel(accel_app, cl::NullRange, cl::NDRange(4), cl::NullRange);
    q.enqueueReadBuffer(res_buf, CL_TRUE, 0, sizeof(float) * 4, res_fpga);
#endif
    // Wait for all scheduled operations to finish
    q.finish();

    // Get the kernel duration
    duration = get_duration_ns (event);

    std::cout << "Checking results CPU vs FPGA\n";
    int error {0};
    for (auto k = 0; k < 16; k++) {
        if (y_fpga[k] != cpu_results[k]) {
            std::cout << "Error index " << k << " : " << y_fpga[k] << " vs " << cpu_results[k] << '\n';
            error ++;
        }
    }
    std::cout << "***** RESULTS *****\n";
    std::cout << "ERRORs: " << error << '\n';
    std::cout << "Kernel compute execution (in ns) = " << duration << '\n';
    std::cout << "CPU compute execution (in ns) = " << time_elapsed_ns << '\n';
}
