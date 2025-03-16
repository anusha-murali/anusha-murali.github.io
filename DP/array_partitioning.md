### Maximum and Minimum Values of Partitioning Array

11. [Maximum and Minimum Values of Partitioning Array](./array_partitioning.md)
    
**Problem**: You have an array $A$ of $n$ integers. You must partition it into $p$ partitions. 
The value of a partition $P$ is computed as follows. Value = $P[0] + P[-1]$, where $P[-1]$ denotes the value of the last element of the partition. If the partition $P$ contains 
only one element, then the value of the partition is Value = $2\cdot P[0]$.
Determine the maximum value and the minimum value of partitioning $A$ into $p$ partitions.

**Solution**

Let `dp_max[i][j]` denote the maximum value when partitioning the first `i` elements of $A$ into `j` partitions.

In an analagous manner, let `dp_min[i][j]` denote the minimum value when partitioning the first `i` elements of $A$ into `j` partitions.

*Approach*: For each position `i` in $A$ (i.e: each subarray $A[1\cdots i]$), we consider all possible ways to partition $A$ into `j` partitions.

Let's say that a given partition starts at index `k` and ends at index `i-1`. So its value is,

$$
\text{value} = 
\begin{cases}
2A[k] & \text{if }k = i-1 ~\text{(single-element partition)} \\
A[k] + A[i-1] & \text{otherwise (multi-element partition)}
\end{cases}
$$

Hence we can update `dp_max[i][j]` with the larger value of `dp_max[i][j]` or `dp_max[k][j-1] + value`, where `k < i` (i.e: $1 \leq k < i$). In other words,

```python
  dp_max[i][j] = max(dp_max[i][j], dp_max[k][j - 1] + value),
```
where `value` is computed as shown above.

In an analogous manner,

```python
  dp_min[i][j] = min(dp_min[i][j], dp_min[k][j - 1] + value).
```

We use $(p+1) \times (n+1)$ sized 2-dimensional arrays (1-based) to build both `dp_max` and `dp_min`. We initialize `dp_max[0][0] = 0` and `dp_min[0][0] = 0`. 

Our function is as follows:

```python
def partitionMinMax(A, p):
    n = len(A)
    if p > n:
        return None  
    
    dp_max = [[-float('inf')] * (n + 1) for _ in range(p + 1)]
    dp_min = [[float('inf')] * (n + 1) for _ in range(p + 1)]
    
    dp_max[0][0] = 0
    dp_min[0][0] = 0
    
    # Fill the DP tables
    for i in range(1, n + 1):
        for j in range(1, p + 1):
            for k in range(i):
                if k == i - 1:
                    value = 2 * A[k]
                else:
                    value = A[k] + A[i - 1]

                dp_max[j][i] = max(dp_max[j][i], dp_max[j - 1][k] + value)
                dp_min[j][i] = min(dp_min[j][i], dp_min[j - 1][k] + value)
    
    return dp_max[p][n], dp_min[p][n]
```

> **Example** `A = [2, 4, 3, 5], p = 2`.
>

We will find the maximum value by stepping through the above function below. The minimum value can be found similarly.

Our 2D array, `dp_max`, is first initialized as follows:

<p align="center"> <img width="350" alt="DP1" src="https://github.com/user-attachments/assets/1ea9e871-d8f5-489e-b745-128e425e901e" /> </p>

Let $i = 1$. So, we are considering the subarray of $A$ with just 1 element, which is 2.  For $i=1, j=1, k=0$, `value = 2*A[0] = 4`.
So, `dp_max[j][i] = max(dp_max[j][i], dp_max[j - 1][k] + value)` = $\max(-\infty, 0 + 4) = 4$. So `dp_max[1][1] = 4`. Hence `dp_max` will become:

<p align="center"> <img width="350" alt="DP2" src="https://github.com/user-attachments/assets/3fb37e9c-ed03-4fc5-9e8b-6692080b2026" /> </p>

Now while $i$ is still $i = 1$, $j$ becomes $j = 2$. For $i=1, j=2, k=0$, `value = 2*A[0] = 4`. 
So, `dp_max[2][1] = max(dp_max[2][1], dp_max[2 - 1][0] + value)` = $\max(-\infty, -\infty + 4) = -\infty$. So `dp_max[2][1] =` $-\infty$. Hence `dp_max`, does not change.

We have now completed the iteration for $i=1$. So, $i$ now becomes $i=2$.

When $i=2, j = 1, k =0$, `value = A[0] + A[1] = 6`. Hence evaluating,
`dp_max[j][i] = dp_max[1][2] = max(dp_max[j][i], dp_max[j - 1][k] + value) = 6`. Therefore, `dp_max` becomes:

<p align="center"> 
<img width="350" alt="DP3" src="https://github.com/user-attachments/assets/147428da-ac2e-4ce0-827b-0ba2e5dfc929" />
</p>

Now $k$ is incremented to $k = 1$. So, $i=2, j = 1, k = 1$. We find that `dp_max[1][2]` doesn't change and still remains `dp_max[1][2] = 6`.

Now $j$ is incremented to $j = 2$. So, $i=2, j=2, k=0$.  Hence evaluating,
`dp_max[j][i] = dp_max[2][2] = max(dp_max[j][i], dp_max[j - 1][k] + value) =` $\max(-\infty, -\infty) = -\infty$. Hence `dp_max`, does not change.

Now $k$ is incremened to $k=1$. So, $i=2, j=2, k=1$. So `value = 2*A[1] = 8`.  Hence evaluating,
`dp_max[j][i] = dp_max[2][2] = max(dp_max[j][i], dp_max[j - 1][k] + value) = ` $\max(-\infty, 4 + 8) = 12`. Therefore, `dp_max` becomes:

**Runtime**: The time complexity is $O(n^2\cdot p)$, where $n$ is the length of the array and $p$ is the number of partitions. The space complexity is $O(n \cdot p)$ for the DP tabless.

[Back to Dynamic Programming Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
