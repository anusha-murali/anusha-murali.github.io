### Longest Increasing Subsequence (LIS)

***

Given an array $A$ of $n$ numbers, find the longest, strictly increasing subsequence of $A$.

> **Example**: $A = [2, 6, 3, 5, 1, 0, 4, 7]$. The longest, strictly increasing subsequence of $A$ is $[2, 3, 4, 7]$ and its length is 4.


Let $\text{DP}[i]$ be the length of the longest increasing subsequence that ends $A[i]$.

For the above example array $A$, the DP array will be as follows:

$$
\begin{align*}
A &=  [2, 6, 3, 5, 1, 0, 4, 7]\\
\text{DP} &= [1, 2, 2, 3, 1, 1, 3, 4] 
\end{align*}
$$

The longest increasing subsequence (LIS) that ends at index 2 is $\text{LIS}(2) = [2, 3]$, which has a length of 2. The LIS that ends at index 3 is $\text{LIS}(3) = [2, 3, 5]$, with the length of 3. We can compute DP[3] from DP[2] by checking if $A[3] > A[2]$.

We will compute the array DP from $i = 0 \ldots n-1$, in the order of $\text{DP}[0], \text{DP}[1], \ldots, \text{DP}[n-1]$.

Hence, when we want to compute $\text{DP}[i]$, we have already computed all the previous values $\text{DP}[0]$, $\text{DP}[1], \ldots$, \text{DP}[i-1]$.

We note that there are two distinct possibilities:

1. If $\text{DP}[i] = 1$, then the LIS ending in index $i$ has only 1 element.
2. If $\text{DP}[i] > 1$, then the LIS ending in index $i$ has more than 1 element, and the last element $A[i]$ is greater than the immediately preceding element $A[j]$ of the LIS. It is obvious that the subsequence ending in $A[j]$ itself is one of the LIS's ending in $A[j]$. Therefore, $DP[i] = DP[j] + 1$.

Hence, letting $m$ be the number of elements in the LIS ending in $A[i]$, we find,

$$
DP[i] = 
\begin{cases}
1 & \text{for }m = 1\\
\displaystyle{\max_{A[j] < A[i]}} (DP[j] + 1) & \text{for } m > 1 \text{ and } j < i
\end{cases}
$$

[Dynamic Programming](./dp.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
