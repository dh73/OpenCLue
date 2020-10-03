// Simple test of OpenCL addition
__kernel void vector_add (__global const int* restrict a, __global const int* restrict b, __global int* restrict c)
{
    int i = get_global_id(0);

    // The actual function
    c[i] = a[i] + b[i];
}
