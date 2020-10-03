#include "accelPlatform.hpp"

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
     * accelerator, from here. */
    cl::Kernel accel_app (program, "matvec_mult", &err);

    // Create buffers and arguments
    std::vector<float> dot {0.0, 3.0, 6.0, 9.0};
    std::array<std::array<float, 4>, 4> m {{
        {{ 0.0,  2.0,  4.0,  6.0}},
        {{ 8.0, 10.0, 12.0, 14.0}},
        {{16.0, 18.0, 20.0, 22.0}},
        {{24.0, 26.0, 28.0, 30.0}}
    }};

    cl::Buffer m_buf    (context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY, sizeof(float)*16, NULL, &err);
    cl::Buffer dot_buf  (context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY, sizeof(float)*4, NULL, &err);
    cl::Buffer res_buf  (context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_WRITE_ONLY, sizeof(float)*4, NULL, &err);

    accel_app.setArg (0, m_buf);
    accel_app.setArg (1, dot_buf);
    accel_app.setArg (2, res_buf);

    // Map host-side buffer to user-space pointers
    float *m_fpga   = (float *) q.enqueueMapBuffer (m_buf,   CL_TRUE, CL_MAP_WRITE, 0, sizeof(float) * 16);
    float *dot_fpga = (float *) q.enqueueMapBuffer (dot_buf, CL_TRUE, CL_MAP_WRITE, 0, sizeof(float) * 4);
    float *res_fpga = (float *) q.enqueueMapBuffer (res_buf, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(float) * 4);

    for (auto i = 0; i < 4; i++) {
        for (auto j = 0; j < 4; j++) {
            m_fpga[j] = m[i][j];
            dot_fpga[j] = dot[j];
            res_fpga[j] = 0;
            std::cout << "\tm_fpga = " << m_fpga[j] << "\n";
            std::cout << "\tdot_fpga = " << dot_fpga[j] << "\n";
        }
    }

    // Execute the kernel
    accel_app.setArg(0, m_buf);
    accel_app.setArg(1, dot_buf);
    accel_app.setArg(2, res_buf);

    // Schedule transfer of inputs to device memory, execution of kernel, and transfer of outputs back to host memory
    q.enqueueNDRangeKernel(accel_app, cl::NullRange, cl::NDRange(4), cl::NullRange);

    // Get results from the device
    float r[4];
    q.enqueueReadBuffer (res_buf, CL_TRUE, 0, sizeof(float) * 4, r);
    
    // Wait for all scheduled operations to finish
    q.finish();

    for (auto k = 0; k < 4; k++)
        std::cout << "\tRes = " << r[k] << std::endl;
}
