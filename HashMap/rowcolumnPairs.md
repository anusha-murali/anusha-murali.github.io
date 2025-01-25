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

**Solution 1**: We can compare each row of the matrix with each row of its transposed matrix.

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

**Solution 2**: The `Counter` is a subclass of `dict` that can be used for counting hashable objects. The `Counter` is a dictionary that objects as keys and counts as values. We pass an iterable of hashable objects as an argument to the `Counter` class's constructor. For example, `Counter(list("California"))` returns `Counter({'a': 2, 'i': 2, 'C': 1, 'l': 1, 'f': 1, 'o': 1, 'r': 1, 'n': 1})`.

We can find the counts of each row occurring in `grid` using, `Counter(map(tuple, grid))`.

Similarly, we can find the counts of each row occurring in the transpose of `grid` using, `Counter(zip(*grid))`. 

Therefore, our solution simplifies into the following:

```
def equalPairs(grid):
    from collections import Counter
    
    transpose_counts = Counter(zip(*grid))                 
    grid_counts = Counter(map(tuple,grid))             
    return  sum(transpose_counts[item]*grid_counts[item] for item in transpose_counts)  
```
We iterate through each item in `transpose_counts` and multiply the count corresponding to the `item` with the count of the same `item` in `grid_counts`. The desired answer is the sum of these products.

**Runtime**: Since the `for` loop iterates through the number of rows in the transposed matrix, the runtime is $O(n)$.

[Back to Hash Map Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
