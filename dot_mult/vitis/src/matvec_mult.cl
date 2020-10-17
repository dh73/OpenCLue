__attribute__((reqd_work_group_size(1,1,1)))
__kernel void matvec_mult (__global const float* restrict m,
                           __global const float* restrict dot_,
                           __global float* restrict result)
                           {   
                               __attribute__((opencl_unroll_hint(4)))
                               for (int i = 0; i < 4; i++) {
                                   result[0] += m[i]    * dot_[i];
                                   result[1] += m[i+4]  * dot_[i];
                                   result[2] += m[i+8]  * dot_[i];
                                   result[3] += m[i+12] * dot_[i];
                               }
                           }