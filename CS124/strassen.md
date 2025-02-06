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

```python
################################################################################
##                                                                            ##
##                 Strassen's Algorithm with Crossover                        ##
##                                                                            ##
################################################################################
#
# The following function computes matrix multiplication of two square matrices 
# using Strassen's algorithm. It uses a crossover threshold of n = 32 to switch
# over from Strassen to the conventional matrix multiplication algorithm.
# Strassen's algorithm has a O(n^(log_2 7)) runtime.
#
def strassen(A, B, C):
    dim = len(A)

    # If the size of the matrices are 32 or less, switch over to the
    # conventional O(n^3) matrix multiplication algorithm.
    #
    if (dim <= 32):
        C = conventionalMatMul(A, B, C)
        return C
    else:
        dim = dim // 2

        a11 = matInitialize(dim)
        a12 = matInitialize(dim)
        a21 = matInitialize(dim)
        a22 = matInitialize(dim)
        b11 = matInitialize(dim)
        b12 = matInitialize(dim)
        b21 = matInitialize(dim)
        b22 = matInitialize(dim)
        c11 = matInitialize(dim)
        c12 = matInitialize(dim)
        c21 = matInitialize(dim)
        c22 = matInitialize(dim)
        m1  = matInitialize(dim)
        m2  = matInitialize(dim)
        m3  = matInitialize(dim)
        m4  = matInitialize(dim)
        m5  = matInitialize(dim)
        m6  = matInitialize(dim)
        m7  = matInitialize(dim)

        matP = matInitialize(dim)
        matQ = matInitialize(dim)

        # Divide each matrix into four equal sizes
        for i in range(dim):
            for j in range(dim):
                a11[i][j] = A[i][j]
                a12[i][j] = A[i][j + dim]
                a21[i][j] = A[i + dim][j]
                a22[i][j] = A[i + dim][j + dim]
 
                b11[i][j] = B[i][j]
                b12[i][j] = B[i][j + dim]
                b21[i][j] = B[i + dim][j]
                b22[i][j] = B[i + dim][j + dim]

        # Compute the resultant matrix using Strassen's algorithm
        #
        # m1 = (a11 + a22)(b11 + b22)
        add(a11, a22, matP)
        add(b11, b22, matQ)
        strassen(matP, matQ, m1)

        # m2 = (a21 + a22)b11
        add(a21, a22, matP)
        strassen(matP, b11, m2)

        # m3 = a11(b12 - b22)
        sub(b12, b22, matQ)
        strassen(a11, matQ, m3)

        # m4 = a22(b21 - b11)
        sub(b21, b11, matQ)
        strassen(a22, matQ, m4)

        # m5 = (a11 + a12)b22
        add(a11, a12, matP)
        strassen(matP, b22, m5)

        # m6 = (a21 - a11)(b11 + b12)
        sub(a21, a11, matP)
        add(b11, b12, matQ)
        strassen(matP, matQ, m6)

        # m7 = (a12 - a22)(b21 + b22)
        sub(a12, a22, matP)
        add(b21, b22, matQ)
        strassen(matP, matQ, m7)

        # Now compute the entries of the resultant C matrix
        
        # c11 = m1 + m4 - m5 + m7
        add(m1, m4, matP)
        add(matP, m7, matQ)
        sub(matQ, m5, c11)

        # c12 = m3 + m5
        add(m3, m5, c12)

        # c21 = m2 + m4
        add(m2, m4, c21)

        # c22 = m1 - m2 + m3 + m6
        sub(m1, m2, matP)
        add(m3, m6, matQ)
        add(matP, matQ, c22)

        # Finally, add the entries to the resultant matrix C
        for i in range(dim):
            for j in range(dim):
                C[i][j] = c11[i][j]
                C[i][j + dim] = c12[i][j]
                C[i + dim][j] = c21[i][j]
                C[i + dim][j + dim] = c22[i][j]
```
