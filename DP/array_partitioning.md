### Maximum and Minimum Values of Partitioning Array

11. [Maximum and Minimum Values of Partitioning Array](./array_partitioning.md)
    
**Problem**: You have an array $A$ of $n$ integers. You must partition it into $p$ partitions. 
The value of a partition $P$ is computed as follows. Value = $P[0] + P[-1]$, where $P[-1]$ denotes the value of the last element of the partition. If the partition $P$ contains 
only one element, then the value of the partition is Value = $2\cdot P[0]$.
Determine the maximum value and the minimum value of partitioning $A$ into $p$ partitions.

**Solution**

Let `dp_max[j][i]` denote the maximum value when partitioning the first `i` elements of $A$ into `j` partitions.

In an analagous manner, let `dp_min[j][i]` denote the minimum value when partitioning the first `i` elements of $A$ into `j` partitions.

We will consider `dp_max[j][i]` for the following discussion.

Let us consider an array with $i$ integers and say that we want to partition it into $j$ partitions. As defined above, `dp_max[j][i]` denotes the maximum possible value when partitioning an array of size $i$ into $j$ partitions. Our question is how to determine `dp_max[j][i]`.

Let us first initialize `dp_max` such that `dp_max[j][i]`  = $-\infty$ for $0 \leq j \leq p, 0 \leq i \leq n$. 

We remove one partition from the right of the array at index $k$. 


<p align="center">
<img width="900" alt="DP0" src="https://github.com/user-attachments/assets/ed5a1c75-e0ad-484d-b596-9407177be96e" />
</p>


If this right partition contains just one element, then its value is $2A[k]$. Otherwise its value is $A[k] + A[i-1].$  In other words,

$$
\text{value} = 
\begin{cases}
2A[k] & \text{if }k = i-1 ~\text{(single-element partition)} \\
A[k] + A[i-1] & \text{otherwise (multi-element partition)}
\end{cases}
$$

Therefore, using the definition of `dp_max[j][i]`, we can now write,

```python
  dp_max[j][i] = max(dp_max[j][i], dp_max[j - 1][k] + value),
```

Hence we can update `dp_max[j][i]` with the larger value of `dp_max[j][i]` or `dp_max[j-1][k] + value`, where `k < i` (i.e: $1 \leq k < i$). In other words, by varying the index $k$ from $1 \leq k \leq i-1$, we could find the maximum value of `dp_max[j][i]` of partitioning an array of $i$ integers into $j$ partitions.


In an analogous manner,

```python
  dp_min[j][i] = min(dp_min[j][i], dp_min[j-1][k] + value).
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

**Memoization**: Since `dp_max[j][i]` is computed from the previously computed values of `dp_max[j-1][k]`, we avoid unnecessary repeated calculations.


**Runtime**: The time complexity is $O(n^2\cdot p)$, where $n$ is the length of the array and $p$ is the number of partitions. The space complexity is $O(n \cdot p)$ for the DP tabless.

> **Example** `A = [2, 4, 3, 5], p = 2`.
>
By running the above algorithm, we find the maximum value is 15 and the minimum value is 13.

[A step-by-step walk-through of the above algorithm can be found here.](./array_partitioning_example.md)


[Back to Dynamic Programming Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
