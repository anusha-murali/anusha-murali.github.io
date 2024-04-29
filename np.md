# P, NP, and NP-Completeness

## P versus NP

An algorithm is considered "efficient" if its running time is bounded by a polynomial function of the input size: $O(n^k)$, where $k > 0$.

A **decision problem** is a problem whose output is a single boolean value: YES or NO. We define 3 classes of decision problems:

1. **P** is the set of decision problems that can be solved in polynomial time. Intuitively, P is the set of problems that can be solved quickly. (Examples: Shortest Paths, Finding MSTs, String Reconstruction)
2. **NP** is the set of all YES/NO problems where a solution can be verified in polynomial time. In other words, if the answer is YES, then there is a *proof* of this fact that can be checked in polynomial time. Intuitively, NP is the set of decision problems where we can verify a YES answer quickly if we have the solution in front of us. (Examples: Traveling Salesman, 3-SAT, Maximum Independent Set, Vertex Cover)
3. **co-NP** is essentially the opposite of NP. If the answer to a problem in co-NP is NO, then there is a proof of this fact that can be checked in polynomial time.

Every decision problem in P is also in NP. If a problem is in P, we can verify YES answers in polynomial time recomputing the answer from scratch! Similarly, every problem in P is also in co-NP.

Perhaps the single most important unanswered question in theoretical computer science is whether the complexity classes P and NP are actually different. (The Clay Mathematics Institute lists P-versus-NP as the first of its seven Millennium Prize Problems).

<p align="center">
<img width="150" alt="17" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/08969ad5-f5f6-4833-adf9-bc068934bbdb">
</p>


## NP-Hard and NP-Complete

### NP-Hard

A problem $\prod$ is NP-hard if a polynomial-time algorithm for $\prod$ would imply a polynomial-time algorithm for every problem in NP. In other words,

$$
\boxed{\prod \text{ is NP-hard } {\large \iff} \text{ If } \prod \text{ can be solved in polynomial time, then P = NP}}
$$

### NP-Complete

A problem is NP-complete if it is both NP-hard and is an element of NP. Informally, NP-complete problems are the hardest problems in NP. A polynomial-time algorithm for even one NP-complete problem would immediately imply a polynomial-time algorithm for every NP-complete problem.

<p align="center">
<img width="400" alt="18" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/9cec12a4-ea78-4a3a-99df-333d2d5121d8">
</p>







***
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


## 4. Closest String

**Problem** Given $n$ binary strings $s_1, \ldots, s_n$, each of length $m$, compute a new string $t$, such that $d = \max_i d(t, s_i)$ is minimized. Note that $d$ is the Hamming distance.

This is a minimization problem. It has been proved that it is NP-hard. The following is a 2-approximation algorithm for solving the closest string problem.

**Algorithm CLOSEST_STRING**

```
Return s_1
```

*Proof*: Because of triangle inequality, we find,

$$
d(s_1, s_i) \leq d(t_{\text{OPT}}, s_1) + d(t_{\text{OPT}}, s_i) ~ \leq ~ 2d.
$$


[Table of Contents](./index.md)
<!--
![111596338](https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002)
-->

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>

