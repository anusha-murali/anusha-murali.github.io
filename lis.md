### Longest Increasing Subsequence (LIS)

***

Given an array $A$ of $n$ numbers, find the longest, strictly increasing subsequence of $A$.

> **Example**: $A = [2, 6, 3, 9, 1, 8, 4, 7]$. The longest, strictly increasing subsequence of $A$ is $[2, 3, 4, 7]$ and its length is 4.


Let $\text{DP}[i]$ be the length of the longest increasing subsequence that ends $A[i]$.

For the above example array $A$, the DP array will be as follows:

$$
\begin{align*}
A &=  [2, 6, 3, 9, 1, 8, 4, 7]\\
\text{DP} &= [1, 2, 2, 3, 1, 3, 3, 4] 
\end{align*}
$$


[Dynamic Programming](./dp.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
