__kernel void matvec_mult (__global const float4* restrict m,
                           __global const float4* restrict dot_,
                           __global float4* restrict result)
                           {
                               int i = get_global_id(0);
                               result[i] = dot(m[i], dot_[0]);
                           }