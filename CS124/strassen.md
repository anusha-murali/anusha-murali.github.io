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

```python
################################################################################
##                                                                            ##
##    Conventional ijk matrix multiplication, which takes O(n^3) runtime      ##
##                                                                            ##
################################################################################
#
def conventionalMatMul(A, B, C):

    for i in range(len(A)):
        for j in range(len(B[0])):
            for k in range(len(B)):
                C[i][j] += A[i][k] * B[k][j]
                
    return C

################################################################################
##                                                                            ##
##       Generalized Strassen's algorithm for arbitrary sized matrices        ##
##                                                                            ##
################################################################################
#
#
def strassenGeneral(A, B, C):

    # Get the power of two, which is equal to or larger than the dimension of
    # the input matrices. For example, if the input matrices A and B have a
    # dimension 8 x 8, then this function will return 8. On the other hand, if
    # the dimensions are 9 x 9, then this function will return 16. We will pad
    # the additional rows and columns with 0 entries.
    n = nextPowerOfTwo(A)
    
    if n > len(A):
        # Initialize padded matrices that are of size n x n
        tempA = [[0 for j in range(n)] for i in range(n)]
        tempB = [[0 for j in range(n)] for i in range(n)]
        tempC = [[0 for j in range(n)] for i in range(n)]

        # Copy over the values of the original matrices A and B onto tempA
        # and tempB
        for i in range(len(A)):
            for j in range(len(A)):
                tempA[i][j] = A[i][j]
                tempB[i][j] = B[i][j]

        strassen(tempA, tempB, tempC)

        # Now, copy only the entries required for the original mutliplication
        # of matrices A and B.
        for i in range(len(C)):
            for j in range(len(C)):
                C[i][j] = tempC[i][j]
    else:
        strassen(A, B, C)
```


```python
################################################################################
##                                                                            ##
##                      Triangles in Random Graphs                            ##
##                                                                            ##
################################################################################
#
# Create an adjacency matrix of dimension, dim representing an undirected graph. 
# The edges of the graph are created using the given propability p.
#
def randomMat(dim, p):
    A = matInitialize(dim)
    for i in range(dim):
        for j in range(i):
            n = np.random.choice([1, 0], p= [p, 1-p])
            if (n == 1):
                A[i][j] = 1
                A[j][i] = 1

    return A

# Count the number of triangles in an undirected graph represented by the
# adjacency matrix A. We compute A^3 using the modified Strassen's algorithm.
# Then divide the sum of the diagonals by 6 to find the number of triangles.
#
def countTriangles(A):
    B = matInitialize(len(A))
    C = matInitialize(len(A))
    strassen(A, A, B)
    strassen(A, B, C)

    count = 0
    # Sum the diagonal entries
    for i in range(len(C)):
        count = count + C[i][i]

    # Return the number oof triangles
    return (int (count / 6))

# This function computes binom(1024,3)*p^3, which is the expected number of
# triangles in a graph where the edges are created with probability p.
#
def expectedNoOfTriangles(p):
    # math.comb(1024,3) = 178433024
    return int (178433024*pow(p, 3))
```

```python
################################################################################
##                                                                            ##
##                             Main Driver                                    ##
##                                                                            ##
################################################################################
#

# Obtain the input arguments
if len(sys.argv) > 1:
    flag = int(sys.argv[1])
    dim = int(sys.argv[2])
    fileName = sys.argv[3]
else:
    dim = 4
    fileName = "t4.txt"
    
# Count the number of triangles in an undirected graph with 1024 vertices
#
pArray = [0.01, 0.02, 0.03, 0.04, 0.05]
for p in pArray:
    A = randomMat(1024, p)
    n = countTriangles(A)
    print("p = ", p, "m = ", expectedNoOfTriangles(p), "n = ", n)
    
# Read the input matrices A and B from the input file
A, B = readMatrix(fileName, dim)

# Initialize the output matrix C
C = [[0 for j in range(dim)] for i in range(dim)]

# Strassen algorithm for square matrices of odd or even dimensions
strassenGeneral(A, B, C)

# Print the diagonal entries of the matrix product
printDiagonals(C)
```

[Back to Divide and Conquer](./dc.md)

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)

