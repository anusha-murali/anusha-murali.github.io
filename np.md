# Approximation Algorithms

**Definition**: Let $P$ be a minimization problem, and $I$ be an instance of $P$. Let $A$ be an algorithm that finds feasible solution to instances of $P$. Let $A(I)$ is the cost of the solution returned by $A$ for instance $I$, and $OPT(I)$ is the cost of the optimal solution (mimimum) for $I$. Then, $A$ is said to be an $\alpha$-approximation algorithm for $P$ if

$$
\forall I, ~~~\frac{A(I)}{OPT(I)} \leq \alpha,
$$

where $\alpha \geq 1$.


## 1. Minimum Vertex Cover

Let $G = (V,E)$ be a graph. The minimum vertex cover is the minimum sized set of vertices that every edge has an endpoint in it (the edge is therefore **covered**).

**Algorithm VC**

```
C <- Empty Set
while E is not empty
  Arbitrarily pick e = (u,v) in E
  C <- C U {u, v}
  Remove all edges incident to u, v from E
```

**Theorem**: Algoritm VC has approximation ratio 2.

*Proof*: Clearly VC is a vertex cover. Next let us prove the ratio. Suppose we pick $k$ edges during the execution of algorithm VC. These $k$ edges form a matching (they don’t share vertices). So, the optimal vertex cover should contain at least one vertex from each of these $k$ edges. Thus $OPT \geq k$.  On the other hand, algorithm VC’s output has size at most $2k$.


## 2. Maximum Independent Set

Let $G = (V, E)$ be a graph. An independent set $V'$ is a subset of $V$ such that no edge connects two vertices in $V'$.

It is known that max independent set is NP-hard.


## 3. Traveling Salesman Problem

Given a graph $G = (V,E)$, the Traveling salesman problem (TSP) with arbitrary weight is to finding a Hamiltonian cycle that has the minimum total weight. 

[Table of Contents](./index.md)
<!--
![111596338](https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002)
-->

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>

