#define CL_HPP_CL_1_2_DEFAULT_BUILD
#define CL_HPP_TARGET_OPENCL_VERSION 120
#define CL_HPP_MINIMUM_OPENCL_VERSION 120
#define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1
//#define CL_USE_DEPRECATED_OPENCL_2_0_APIS
#define CL_USE_DEPRECATED_OPENCL_1_2_APIS

#include <iostream>
#include <cstdlib>
#include <vector>
#include <fstream>
#include <unistd.h>
#include <string>

// the OpenCL header for c++
#include <CL/cl.hpp>

// Function prototypes
char* read_binary_file (const std::string &accel_file_name, unsigned &nb);

int main (int argc, char** argv) {
    // To programm the FPGA
    std::string fpgaFile = (argc != 2) ? "default.aocx" : argv[1];
    unsigned fileBufsize;
    char* fileBuf = read_binary_file(fpgaFile, fileBufsize);
    cl::Program::Binaries fpga_bins {{fileBuf, fileBufsize}};

    // Scan the number of platforms
    std::vector<cl::Platform> platforms;
    cl::Platform::get(&platforms);

    // If there's no platform, show an error.
    if (platforms.size() == 0) {
        std::cout << "ERROR: No platform found on this host.\n";
        exit(EXIT_FAILURE);
    }
    
    // We have a platform
    cl::Platform accel_platform = platforms.front();
    std::cout<< "INFO: Using platform: " << accel_platform.getInfo<CL_PLATFORM_NAME>() << std::endl;

    // Now we need to scan the device
    std::vector<cl::Device> fpga_devices;
    accel_platform.getDevices(CL_DEVICE_TYPE_ACCELERATOR, &fpga_devices);
    if (fpga_devices.size() == 0) {
        std::cout << "ERROR: No device for platform " << accel_platform.getInfo<CL_PLATFORM_NAME>() << " found.\n";
        exit(EXIT_FAILURE);
    }

    // We have a device
    cl::Device fpga_accel = fpga_devices.front();
    fpga_devices.resize(1);
    std::cout << "INFO: Using device: " << fpga_accel.getInfo<CL_DEVICE_NAME>() << '\n';

    // Create a context
    cl_int err;
    cl::Context context ({fpga_accel});
    cl::Program fpga_progam (context, fpga_devices, fpga_bins, NULL, &err);
    
    // Queues to execute (send) commands
    cl::CommandQueue q (context, fpga_accel, CL_QUEUE_PROFILING_ENABLE, &err);
    cl::Kernel kernel_app (fpga_progam, "vector_add", &err);

    // Create buffers
    cl::Buffer a_buff (context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY, sizeof(int) * 10, NULL, &err);
    cl::Buffer b_buff (context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY, sizeof(int) * 10, NULL, &err);
    cl::Buffer c_buff (context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_WRITE_ONLY, sizeof(int) * 10, NULL, &err);
    
    // Map buffers to kernel arguments
    kernel_app.setArg (0, a_buff);
    kernel_app.setArg (1, b_buff);
    kernel_app.setArg (2, c_buff);

    // Map host-side buffer to user-space pointers
    int *a_from_fpga = (int *) q.enqueueMapBuffer (a_buff, CL_TRUE, CL_MAP_WRITE, 0, sizeof(int) * 10);
    int *b_from_fpga = (int *) q.enqueueMapBuffer (b_buff, CL_TRUE, CL_MAP_WRITE, 0, sizeof(int) * 10);
    int *c_from_fpga = (int *) q.enqueueMapBuffer (c_buff, CL_TRUE, CL_MAP_WRITE | CL_MAP_READ, 0, sizeof(int) * 10);

    // The actual testvectors
    for(int i = 0 ; i < 10 ; i++) {
        a_from_fpga[i] = rand() % 10;
        b_from_fpga[i] = rand() % 10;
        c_from_fpga[i] = 0;
    }

    // Execute the kernel
    kernel_app.setArg(0, a_buff);
    kernel_app.setArg(1, b_buff);
    kernel_app.setArg(2, c_buff);

    // Schedule transfer of inputs to device memory, execution of kernel, and transfer of outputs back to host memory
    //q.enqueueMigrateMemObjects({a_buff, b_buff}, 0 /* 0 means from host*/);
    //q.enqueueTask(kernel_app);
    //q.enqueueMigrateMemObjects({c_buff}, CL_MIGRATE_MEM_OBJECT_HOST);
    q.enqueueNDRangeKernel(kernel_app, cl::NullRange, cl::NDRange(10), cl::NullRange);
    // Wait for all scheduled operations to finish
    q.finish();

    int C[10];
    q.enqueueReadBuffer(c_buff, CL_TRUE, 0, sizeof(int) * 10, C);

    // Checking values
    bool match = true;
    for (int i = 0 ; i < 10 ; i++) {
        int expected = a_from_fpga[i] + b_from_fpga[i];
        std::cout << "OUT[" << i << "] is " << c_from_fpga[i] << std::endl;
        if (c_from_fpga[i] != expected){
            std::cout << "Error: Result mismatch" << std::endl;
            std::cout << "i = " << i << " CPU result = " << expected << " Device result = " << a_from_fpga[i] << std::endl;
            match = false;
            break;
        }
    }

    delete[] fileBuf;

    std::cout << "TEST " << (match ? "PASSED" : "FAILED") << std::endl;
    return (match ? EXIT_SUCCESS : EXIT_FAILURE);
}

char* read_binary_file (const std::string &accel_file_name, unsigned &nb)
{
    if(access(accel_file_name.c_str(), R_OK) != 0) {
        std::cout << "ERROR:  Binary " << accel_file_name.c_str() << " not found. Probably is not built or you passed wrong file/path." << std::endl;
        exit(EXIT_FAILURE);
    }
    // Loading the accel bin to the buffer
    std::cout << "INFO: Loading " << accel_file_name << std::endl;
    std::ifstream accel_file (accel_file_name.c_str(), std::ifstream::binary);
    accel_file.seekg (0, accel_file.end);
    nb = accel_file.tellg();
    accel_file.seekg (0, accel_file.beg);
    char *buf = new char [nb];
    accel_file.read(buf, nb);
    return buf;
}