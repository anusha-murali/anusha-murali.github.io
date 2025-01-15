# Set Cover

Given $X = \{x_1,\ldots,x_n\}$, and a collection of subsets ${\mathcal S}$ of $X$ such that $\cup_{s\in {\mathcal S}} S = X$, find the subset $\mathcal{T} \subseteq \mathcal{S}$ s.t. sets of $\mathcal T$ cover $X$.




Greedily choose the set that covers the most number of the remaining uncovered elements at each iteration.
**Claim**: Let $k$ be the size of the smallest set cover for the instance $(X, \mathcal{S})$. Then the greedy heuristic finds a set cover of size at most $k ~\ln n$.

**Runtime**: $O(|U|)$

*Note*: Not always optimal; achieves $O(\log n)$ approximation ratio.


[Back to Greedy Algorithms](./greedy.md)

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)

