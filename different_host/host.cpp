#include <iostream>
#include <fstream>
#include <cstdlib>
#include <vector>
#include <string>
#include <unistd.h>
#include "host.hpp"

int main (int argc, char** argv)
{
    // First step: Initialise the OpenCL environment
    cl_int err;
    std::string binaryFile = (argc != 2) ? "default.aocx" : argv[1];
    unsigned fileBufSize;
    std::vector<cl::Device> devices = get_accel_devices();
    devices.resize(1);
    cl::Device device = devices[0];
    cl::Context context (device, NULL, NULL, NULL, &err);
    char* fileBuf = read_binary_file(binaryFile, fileBufSize);
    cl::Program::Binaries bins {{fileBuf, fileBufSize}};
    cl::Program program (context, devices, bins, NULL, &err);
    cl::CommandQueue q (context, device, CL_QUEUE_PROFILING_ENABLE, &err);
    cl::Kernel kernel_app (program, "vadd", &err);

    // Create buffers and allocate memory --- This is depending on the kernel needs
    cl::Buffer in1_buf(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY,  sizeof(int) * DATA_SIZE, NULL, &err);
    cl::Buffer in2_buf(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY,  sizeof(int) * DATA_SIZE, NULL, &err);
    cl::Buffer out_buf(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_WRITE_ONLY, sizeof(int) * DATA_SIZE, NULL, &err);

    // Map buffers to kernel arguments, thereby assigning them to specific device memory banks
    kernel_app.setArg(0, in1_buf);
    kernel_app.setArg(1, in2_buf);
    kernel_app.setArg(2, out_buf);

    // Map host-side buffer memory to user-space pointers
    int *in1 = (int *)q.enqueueMapBuffer(in1_buf, CL_TRUE, CL_MAP_WRITE, 0, sizeof(int) * DATA_SIZE);
    int *in2 = (int *)q.enqueueMapBuffer(in2_buf, CL_TRUE, CL_MAP_WRITE, 0, sizeof(int) * DATA_SIZE);
    int *out = (int *)q.enqueueMapBuffer(out_buf, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(int) * DATA_SIZE);

    // Initialize the vectors used in the test
    for(int i = 0 ; i < DATA_SIZE ; i++){
        in1[i] = rand() % DATA_SIZE;
        in2[i] = rand() % DATA_SIZE;
        out[i] = 0;
    }

    // Execute the kernel
    kernel_app.setArg(0, in1_buf);
    kernel_app.setArg(1, in2_buf);
    kernel_app.setArg(2, out_buf);

    // Schedule transfer of inputs to device memory, execution of kernel, and transfer of outputs back to host memory
    q.enqueueMigrateMemObjects({in1_buf, in2_buf}, 0 /* 0 means from host*/);
    q.enqueueTask(kernel_app);
    q.enqueueMigrateMemObjects({out_buf}, CL_MIGRATE_MEM_OBJECT_HOST);

    // Wait for all scheduled operations to finish
    q.finish();

    // Checking values
    bool match = true;
    for (int i = 0 ; i < DATA_SIZE ; i++) {
        int expected = in1[i]*in2[i];
        std::cout << "OUT[" << i << "] is " << out[i] << std::endl;
        if (out[i] != expected){
            std::cout << "Error: Result mismatch" << std::endl;
            std::cout << "i = " << i << " CPU result = " << expected << " Device result = " << out[i] << std::endl;
            match = false;
            break;
        }
    }

    delete[] fileBuf;

    std::cout << "TEST " << (match ? "PASSED" : "FAILED") << std::endl;
    return (match ? EXIT_SUCCESS : EXIT_FAILURE);
}
