# Dynamic Programming

A **divide-and-conquer** algorithm partitions the problem into **disjoint subproblems**, solves the subproblems recursively, and then combine the solutions to solve the original problem. 

A **dynamic programming** algorithm is suitable when the subproblems overlap. A divide-and-conquer approach is not optimal when the subproblems overlap as it will unnecessarily do more work than necessary, repeatedly solving common subproblems that were previously solved. 

We have the following four steps in using dynamic programming to solving a problem where subproblems overlap:
1. Define the structure of the subproblem.
2. Define the recurrence for an optimal solution to the subproblem.
3. Compute the value of an optimal solution solution to the original problem (with reuse, generally in a bottom-up fashion).
4. Generate the optimal solution, in addition to the optimal value.


## 1. Rod Cutting

**Problem**: A steel shop sells rods of different *integer* lengths, which are cut from a long steel rod. The shop charges $p_i$ dollars for a rod of length $i$. The shop wants to sell the rod pieces in such a way so as to maximize its revenue.
1. What is the maximum revenue the shop can get on a rod of length $n$?
2. What are the lengths of the rod pieces that yield the maximum revenue?

> **Example**: Let $p = [0, 2, 7, 8, 10]$. The maximum revenue the shop can get on a rod of length 3 is \\$9, which is obtained by cutting it into pieces of lengths 1 and 2. Similarly, the maximum revenue the shop can get on a rod of length 4 is \\$14, which is obtained by cutting it into two pieces of equal lengths 2. 

[Rod Cutting Solution](./rod_cutting.md)


## 2. Fibonacci Sequence

The $n^{\text{th}}$ Fibonacci number is given by,

$$
F(n) = 
\begin{cases}
0 & \text{for }n=0\\
1 & \text{for }n=1\\
F(n-1) + F(n-2) & \text{for }n >1
\end{cases}
$$

Find the $n^{\text{th}}$ Fibonacci number.

[Fibonacci Number Solution](./fibonacci.md)


## 3. Maximum Sum Subarray

Find a non-empty contiguous subarray of a given array $A$ such that it has the largest possible sum.

> **Example**: $A = [5, -2, 4, -10,  7, -2, 3, -8]$. The maximum sum subarray of $A$ is $[7, -2, 3]$ and the maximum sum is 8.

[Maximum Sum Subarray Solution](./max_sum_subarray.md)


## 4. Longest Increasing Subsequence (LIS)

Given an array $A$ of $n$ numbers, find the longest, strictly increasing subsequence or LIS of $A$.

> **Example**: $A = [2, 6, 3, 5, 1, 0, 4, 7]$. The longest, strictly increasing subsequence of $A$ is $[2, 3, 4, 7]$ and its length is 4.

[LIS Solution](./lis.md)

## 5. Longest Common Subsequence (LCS)

Given two strings $S_1$ and $S_2$ find the longest common subsequence or LCS of $S_1$ and $S_2$.

> **Example**: $S_1$ = 'ANUSHAMURALI' and $S_2$ = 'ANUPAMURALI'. The LCS of $S_1$ and $S_2$ is 'ANUAMURALI' and its length is 10.

[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>

