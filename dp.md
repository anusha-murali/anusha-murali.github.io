# Dynamic Programming

A **divide-and-conquer** algorithm partitions the problem into **disjoint subproblems**, solves the subproblems recursively, and then combine the solutions to solve the original problem. 

A **dynamic programming** algorithm is suitable when the subproblems overlap. A divide-and-conquer approach is not optimal when the subproblems overlap as it will unnecessarily do more work than necessary, repeatedly solving common subproblems that were previously solved. 

We have the following four steps in using dynamic programming to solving a problem where subproblems overlap:
1. Define the structure of the subproblem.
2. Define the recurrence for an optimal solution to the subproblem.
3. Compute the value of an optimal solution solution to the original problem (with reuse, generally in a bottom-up fashion).
4. Generate the optimal solution, in addition to the optimal value.


## Rod Cutting

**Problem**: A steel shop sells rods of different *integer* lengths, which are cut from a long steel rod. The shop charges $p_i$ dollars for a rod of length $i$. The shop wants to sell the rod pieces in such a way so as to maximize its revenue.

Let us say that the shop has a rod of length $n$, which the owner wants to cut into lengths $i_1, i_2, \ldots, i_k$, $1 \leq k \leq n$, in such a way so as to maximize the revenue. So, we have,

$$
n = i_1 + i_2 + \cdots + i_k,
$$

and the corresponding maximum revenue is,

$$
r_n = p_{i_1} + p_{i_2} + \cdots + p_{i_k}.
$$

**Optimal Substructure**: We note that this problem exhibits the *optimal substructure* property - in order to solve the original problem of size $n$, we solve the same problem on smaller sizes. In other words, once we make a cut, we can consider the two pieces as independent instances of the rod-cutting problem. For example, if we cut the rod into lengths of $k$ and $n-k$, then we find the optimum revenues $r_k$ and $r_{n-k}$ of further cutting the two pieces, for a total revenue of $r_n = r_k + r_{n-k}$.

We can cut a rod of length $n$ in $2^{n-1}$ ways (either cut or not cut at each of the $n-1$ integer lengths).

Therefore, for each of the $2^{n-1}$ cuts, we cut the rod into a left piece of length $i$, which can be sold for $p_i$, and sell the remaining length $n-i$ for an optimal revenue of $r_{n-i}$. Hence, we have the following recurrence:

$$
r_n = 
\begin{cases}
0 & \text{for }n = 0\\
\displaystyle{\max_{1 \leq i \leq n}} (p_i + r_{n-i}) & \text{for } n > 0
\end{cases}
$$






[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>

