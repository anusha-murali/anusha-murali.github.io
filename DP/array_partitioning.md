### Maximum and Minimum Values of Partitioning Array

**Problem**: You have an array $A$ of $n$ integers. You must partition it into $p$ partitions. 
The value of a partition $P$ is computed as follows. Value = $P[0] + P[-1]$, where $P[-1]$ denotes the value of the last element of the partition. If the partition $P$ contains 
only one element, then the value of the partition is Value = $2\cdot P[0]$.
Determine the maximum value and the minimum value of partitioning $A$ into $k$ partitions.

**Solution**

Let `dp_max[i][j]` denote the maximum value when partitioning the first `i` elements of $A$ into `j` partitions.

In an analagous manner, let `dp_min[i][j]` denote the minimum value when partitioning the first `i` elements of $A$ into `j` partitions.

*Approach*: For each position `i` in $A$ (i.e: each subarray $A[1\cdots i]$), we consider all possible ways to partition $A$ into `j` partitions.

Let's say that a given partition starts at index `k` and ends at index `i-1`. So its value is,

$$
\text{value} = 
\begin{cases}
2A[k] & \text{if }k = i-1 \text{(single-element partition)} \\
A[k] + A[i-1] & \text{otherwise (multi-element partition)}
\end{cases}
$$

Hence we can update `dp_max[i][j]` as the larger value of `dp_max[i][j]` or `dp_max[k][j-1] + value`, where `k < i` (i.e: $1 \leq k < i$). In other words,

```python
  dp_max[i][j] = max(dp_max[i][j], dp_max[k][j - 1] + value),
```
where `value` is computed as shown above.

In an analogous manner,

```python
  dp_min[i][j] = min(dp_min[i][j], dp_min[k][j - 1] + value).
```

We use $(p+1) \times (n+1)$ arrays (1-indexed arrays) to build both `dp_max` and `dp_min`. We initialize `dp_max[0][0] = 0` and `dp_min[0][0] = 0`. 

Our function is as follows:

```python
def partitionMinMax(A, p):
    n = len(A)
    if p > n:
        return None  
    
    dp_max = [[-float('inf')] * (p + 1) for _ in range(n + 1)]
    dp_min = [[float('inf')] * (p + 1) for _ in range(n + 1)]
    
    dp_max[0][0] = 0
    dp_min[0][0] = 0
    
    # Fill the DP tables
    for i in range(1, n + 1):
        for j in range(1, p + 1):
            for k in range(i):
                # Value of the partition from k to i-1
                if k == i - 1:
                    partition_value = 2 * A[k]
                else:
                    partition_value = A[k] + A[i - 1]
                
                # Update dp_max and dp_min
                if dp_max[k][j - 1] != -float('inf'):
                    dp_max[i][j] = max(dp_max[i][j], dp_max[k][j - 1] + partition_value)
                if dp_min[k][j - 1] != float('inf'):
                    dp_min[i][j] = min(dp_min[i][j], dp_min[k][j - 1] + partition_value)
    
    return dp_max[n][p], dp_min[n][p]
```



**Runtime**: The total number of additions and multiplications done by the two `for` loops result in a runtime of $O(n^2)$.

[Back to Dynamic Programming Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
