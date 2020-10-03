extern "C" {
	void vadd (
	        const unsigned int *in1, // Read-Only Vector 1
	        const unsigned int *in2, // Read-Only Vector 2
	        unsigned int *out       // Output Result
	        )
	{
#pragma HLS INTERFACE m_axi port=in1 bundle=aximm1
#pragma HLS INTERFACE m_axi port=in2 bundle=aximm2
#pragma HLS INTERFACE m_axi port=out bundle=aximm1

	    for(int i = 0; i < 8192; ++i)
	    {
	        out[i] = in1[i] * in2[i];
	    }
	}
}


