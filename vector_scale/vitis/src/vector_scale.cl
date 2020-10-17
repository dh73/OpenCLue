#define SIZE 16

__attribute__((reqd_work_group_size(1,1,1)))
__kernel void vector_scale 
(__global float16 *restrict x,
 __global float16 *restrict y)
 {
     __attribute__((opencl_unroll_hint(SIZE)))
     vscale: for (int i = 0; i < SIZE; i++) {
         y[i] = x[i] * 5;
     }
 }