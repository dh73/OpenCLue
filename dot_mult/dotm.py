#!/bin/env python3

import numpy as np

dot = ([0.0, 3.0, 6.0, 9.0])

m   = ([0.0, 2.0, 4.0, 6.0],
       [8.0, 10.0, 12.0, 14.0],
       [16.0, 18.0, 20.0, 22.0],
       [24.0, 26.0, 28.0, 30.0])

result = np.dot(m,dot)
print ("Result is {}".format(result))