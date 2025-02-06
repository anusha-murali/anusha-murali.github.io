```python
import time
import sys
import numpy as np
import math
from numpy import loadtxt

################################################################################
##                                                                            ##
##                            Utility Functions                               ##
##                                                                            ##
################################################################################

# Print a square matrix
def printMatrix(M):
    m = len(M)
    for i in range(m):
        print("| ", end="")
        for j in range(m):
            print("%2d" % (M[i][j]), end=" ")
        print("|")

# Intialize a square matrix of size dim
def matInitialize(dim):
    M = [[0 for j in range(dim)] for i in range(dim)]
    return M

# The following function reads matrices A and B from an input
# file
def readMatrix(fileName, d):
    A = matInitialize(d)
    B = matInitialize(d)

    data = loadtxt(fileName, dtype='int')

    # Read in the first matrix A
    for i in range(d):
            for j in range(d):
                A[i][j] = data[i*d + j]

    # Read in the second matrix B
    for i in range(d):
            for j in range(d):
                B[i][j] = data[d*d + i*d + j]
                
    return A, B


# Add matrix A and B and store the result in matrix C
def add(A, B, C):
    dim = len(A)
    for i in range(dim):
        for j in range(dim):
            C[i][j] = A[i][j] + B[i][j]


# Subtract matrix B from A and store the result in matrix C
def sub(A, B, C):
    dim = len(A)
    for i in range(dim):
        for j in range(dim):
            C[i][j] = A[i][j] - B[i][j]

# Print diagonals of a square matrix
def printDiagonals(C):
    dim = len(C)
    for i in range(dim):
        print(C[i][i])

# Return the next power of 2, which is larger than the dimension
# of matrix M
def nextPowerOfTwo(M):
    m = len(M)
    return pow(2, int(math.ceil(math.log2(m))))
```
