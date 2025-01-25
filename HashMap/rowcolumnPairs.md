### Equal Row and Column Pairs

This is a nice problem from LeetCode (Problem #2352)

**Problem**: Given a 0-indexed $n \times n$ integer matrix grid, return the number of pairs $(r_i, c_j)$ such that row $r_i$ and column $c_j$ are equal.

A row and column pair is considered equal if they contain the same elements in the same order (i.e., an equal array).

 

Example 1:

$$
\begin{bmatrix}
3 & 2 & 1 \\
1 & 7 & 6 \\
2 & 7 & 7 
\end{bmatrix}
$$

Input: grid = [[3,2,1],[1,7,6],[2,7,7]];
Output: 1

Explanation: There is 1 equal row and column pair:
- (Row 2, Column 1): [2,7,7]
  
Example 2:

$$
\begin{bmatrix}
3 & 1 & 2 & 2 \\
1 & 4 & 4 & 5\\
2 & 4 & 2 & 2\\
2 & 4 & 2 & 2
\end{bmatrix}
$$

Input: grid = [[3,1,2,2],[1,4,4,5],[2,4,2,2],[2,4,2,2]];
Output: 3

Explanation: There are 3 equal row and column pairs:
- (Row 0, Column 0): [3,1,2,2]
- (Row 2, Column 2): [2,4,2,2]
- (Row 3, Column 2): [2,4,2,2]

**Solution** We can compare each row of the matrix with each column of the matrix by first creating a transpose of the original matrix. Then we can just compare the rows.

We can easily transpose a matrix, represented as list of lists, by using the `zip()` function. The `zip()` function takes iterables and aggregates them in a tuple.

**Runtime**:  

[Back to Hash Map Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
