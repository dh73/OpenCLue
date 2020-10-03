#define CL_HPP_ENABLE_EXCEPTIONS
#define CL_HPP_TARGET_OPENCL_VERSION 120
#define CL_HPP_MINIMUN_OPENCL_VERSION 120 

#include <iostream>
#include <cstdlib>
#include <vector>
#include <unistd.h>
#include <fstream>
#include <tuple>

#include <CL/cl.hpp>

char* fpga_binary_file (const std::string &file_name, unsigned &nb) 
{
    if(access(file_name.c_str(), R_OK) != 0) {
        std::cout << "ERROR:  Binary " << file_name.c_str() << " not found. Probably is not built or you passed wrong file name/path for the FPGA binary." << std::endl;
        exit(EXIT_FAILURE);
    }
    // Loading the accel bin to the buffer
    std::cout << "\tINFO: Loading " << file_name << std::endl;
    std::ifstream accel_file (file_name.c_str(), std::ifstream::binary);
    accel_file.seekg (0, accel_file.end);
    nb = accel_file.tellg();
    accel_file.seekg (0, accel_file.beg);
    char *buf = new char [nb];
    accel_file.read(buf, nb);
    return buf;
}

class accelPlatfom
{
private:
    std::string aocl_bin_file_ {};
public:
    accelPlatfom (std::string bin_file) 
        : aocl_bin_file_(bin_file) 
    {};
    ~accelPlatfom ();
    std::tuple<cl::Context, cl::Program, cl::CommandQueue> setupAccelerator();
};

accelPlatfom::~accelPlatfom ()
{
    std::cout << "INFO: Destroying constructor and exiting.\n";
}

std::tuple<cl::Context, cl::Program, cl::CommandQueue> accelPlatfom::setupAccelerator()
{

    std::vector<cl::Platform> platforms;
    cl::Platform::get (&platforms);
    
    if (platforms.size() == 0) {
        std::cout << "\tERROR: No platform found on this host.\n";
        exit(EXIT_FAILURE);
    }

    cl::Platform accel_platform = platforms.front();
    std::cout<< "\tINFO: Using platform: " << accel_platform.getInfo<CL_PLATFORM_NAME>() << std::endl;

    std::vector<cl::Device> fpga_devices;
    accel_platform.getDevices(CL_DEVICE_TYPE_ACCELERATOR, &fpga_devices);
    if (fpga_devices.size() == 0) {
        std::cout << "\tERROR: No device for platform " << accel_platform.getInfo<CL_PLATFORM_NAME>() << " found.\n";
        exit(EXIT_FAILURE);
    }

    cl::Device fpga_accel = fpga_devices.front();
    fpga_devices.resize(1);
    std::cout << "\tINFO: Using device: " << fpga_accel.getInfo<CL_DEVICE_NAME>() << '\n';

    unsigned fileBufSize;
    char* filebuf = fpga_binary_file (aocl_bin_file_, fileBufSize);
    cl::Program::Binaries fpga_bins {{filebuf, fileBufSize}};

    cl_int err;
    cl::Context context {{fpga_accel}};
    cl::Program fpga_program (context, fpga_devices, fpga_bins, NULL, &err);

    cl::CommandQueue q (context, fpga_accel, CL_QUEUE_PROFILING_ENABLE, &err);

    return std::make_tuple (context, fpga_program, q);
}