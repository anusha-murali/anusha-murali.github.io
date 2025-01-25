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

**Solution** We can compare each row of the matrix with each row of its transposed matrix.

For example, we can transpose the matrix in Example 2 and obtain the following transposed matrix, and then compare each row of the original matrix with each row of its transposed matrix.

$$
\begin{bmatrix}
3 & 1 & 2 & 2 \\
1 & 4 & 4 & 5\\
2 & 4 & 2 & 2\\
2 & 4 & 2 & 2
\end{bmatrix}
\longrightarrow
\begin{bmatrix}
3 & 1 & 2 & 2 \\
1 & 4 & 4 & 4 \\
2 & 4 & 2 & 2 \\
2 & 5 & 2 & 2
\end{bmatrix}
$$

We can easily transpose a matrix, represented as list of lists, by using the `zip()` function. The `zip()` function takes iterables and aggregates them in a tuple. For example, `list(zip([1, 2], [3, 4], [5, 6]))` will return `[[1, 3, 5], [2, 4, 6]]`, where we first iterate through the corresponding elements in each of
the three lists and then generate a list. Therefore, using the `zip()` function, we can construct the following solution to our problem:

```
def equalPairs(grid):
    transpose =  list(map(list, zip(*grid)))
    count = 0
    for i in range(len(grid)):
        if grid[i] in transpose:
            count += transpose.count(grid[i])
    return count
```

Note that the `zip()` function is being passed a packed argument. The packed argument syntax using `*` implies that given a sequence of arguments `args`, `zip(*args)` will call `zip()` such that each element in `args` is a separate positional argument of `zip()`. Since our argument `grid` is a list of lists (matrix), the `zip()` function will be called on each of the rows of the `grid`. 

**Runtime**:  Ignoring the cost of transposing the matrix, the `for` loop gives us a runtime of $O(n)$.

[Back to Hash Map Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
