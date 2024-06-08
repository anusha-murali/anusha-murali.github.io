### Longest Increasing Subsequence (LIS)

***

Given an array $A$ of $n$ numbers, find the longest, strictly increasing subsequence of $A$.

> **Example**: $A = [2, 6, 3, 5, 1, 8, 4, 7]$. The longest, strictly increasing subsequence of $A$ is $[2, 3, 4, 7]$ and its length is 4.


Let $\text{DP}[i]$ be the length of the longest increasing subsequence that ends $A[i]$.

For the above example array $A$, the DP array will be as follows:

$$
\begin{align*}
A &=  [2, 6, 3, 5, 1, 8, 4, 7]\\
\text{DP} &= [1, 2, 2, 3, 1, 3, 3, 4] 
\end{align*}
$$

The longest increasing subsequence (LIS) that ends at index 2 is $\text{LIS}(2) = [2, 3]$, which has a length of 2. The LIS that ends at index 3 is $\text{LIS}(3) = [2, 3, 5]$, with the length of 3. We can compute DP[3] from DP[2] by checking $A[3] > A[2]$.

[Dynamic Programming](./dp.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
