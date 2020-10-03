#define CL_HPP_CL_1_2_DEFAULT_BUILD
#define CL_HPP_TARGET_OPENCL_VERSION 120
#define CL_HPP_MINIMUM_OPENCL_VERSION 120
#define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1
#define CL_USE_DEPRECATED_OPENCL_1_2_APIS

// For the OpenCL accel kernel
#define DATA_SIZE 8192

// OpenCL header
#include <CL/cl2.hpp>

// Scan and select proper acceleration device
std::vector<cl::Device> get_accel_devices()
{
    size_t i;
    cl_int err;
    std::vector<cl::Platform> platforms;
    err = cl::Platform::get(&platforms);
    cl::Platform platform;

    for (i = 0; i < platforms.size(); i++) {
        platform = platforms[i];
        std::string platformName = platform.getInfo<CL_PLATFORM_NAME>(&err);
        std::cout << "Platforms found so far: " << platformName << std::endl;
        if (platformName == "Xilinx") {
            std::cout << "INFO: Found Xilinx Accel Card." << std::endl;
            break;
        }
    }

    if (i == platforms.size()) {
        std::cout << "ERROR: Failed to find suitable accel platform." << std::endl;
        exit(EXIT_FAILURE);
    }

    // Select the first accelerator device
    std::vector<cl::Device> devices;
    err = platform.getDevices(CL_DEVICE_TYPE_ACCELERATOR, &devices);
    return devices;
}

char* read_binary_file (const std::string &accel_file_name, unsigned &nb)
{
    if(access(accel_file_name.c_str(), R_OK) != 0) {
        std::cout << "ERROR:  " << accel_file_name.c_str() << " not found. Probably is not built or you passed wrong file/path." << std::endl;
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
