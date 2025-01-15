# P, NP, NP-Hard and NP-Completeness

## 1. P versus NP

An algorithm is considered "efficient" if its running time is bounded by a polynomial function of the input size: $O(n^k)$, where $k > 0$.

A **decision problem** is a problem whose output is a single boolean value: YES or NO. We define 3 classes of decision problems:

1. **P** is the set of decision problems that can be solved in polynomial time. Intuitively, P is the set of problems that can be solved quickly. (Examples: Shortest Paths, Finding MSTs, String Reconstruction)
2. **NP** is the set of all YES/NO problems where a solution can be verified in polynomial time. In other words, if the answer is YES, then there is a *proof* of this fact that can be checked in polynomial time. Intuitively, NP is the set of decision problems where we can verify a YES answer quickly if we have the solution in front of us. (Examples: Traveling Salesman, 3-SAT, Maximum Independent Set, Vertex Cover)
   - 3-SAT: Is there are solution to $(x_1 \lor x_2 \lor \bar{x}_3) \land (x_1 \lor \bar{x}_2 \lor x_3) \land (\bar{x}_1 \lor x_2 \lor x_3) \land (\bar{x}_1 \lor \bar{x}_2 \lor \bar{x}_3)$?
        - **Witness**: An assignment of each of the variables to TRUE or FALSE. Ex: $x_1 = F, x_2 = F, x_3 = F$.
        - **Polynomial time verifier**: Plug the witness into the 3-SAT formula.
   - Independent Set: Is there an independent set of size $k$?
        - **Witness**: A set of $k$ vertices that form an independent set.
        - **Polynomial time verifier**: Ensure that no 2 vertices in the witness have an edge between them.
4. **co-NP** is essentially the opposite of NP. If the answer to a problem in co-NP is NO, then there is a proof of this fact that can be checked in polynomial time.
  
Every decision problem in P is also in NP, so **P is a subset of NP**. If a problem is in P, we can verify YES answers in polynomial time recomputing the answer from scratch! Similarly, every problem in P is also in co-NP.

Perhaps the single most important unanswered question in theoretical computer science is whether the complexity classes P and NP are actually different. (The Clay Mathematics Institute lists P-versus-NP as the first of its seven Millennium Prize Problems).

<p align="center">
<img width="150" alt="17" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/08969ad5-f5f6-4833-adf9-bc068934bbdb">
</p>


## 2. NP-Hard 

A problem $A$ is NP-hard if a polynomial-time algorithm for $A$ would imply a polynomial-time algorithm for every problem in NP. In other words,

$$
\boxed{A \text{ is NP-hard } {\large \iff} \text{ If } A \text{ can be solved in polynomial time, then P = NP}}
$$

**To prove that problem $A$ is NP-hard, reduce a known NP-hard problem to $A$**

#### List of NP-hard problems
1. **Circuit-SAT**: Given a Boolean circuit determine if there is an assignment to  its inputs such that output is TRUE. (Proof: Cook-Levin Theorem)
2. **3-SAT**: Given a 3-CNF formula, find the values of the Boolean variables that make this formula TRUE. (Proof: Circuit-SAT reduced to 3-SAT)
3. **Independent Set**: A subset of vertices of a graph with no edges between the vertices. (Proof: 3-SAT reduced to independent set).
4. **Vertex Cover** A subset of vertices of a graph that includes at least 1 endpoint of every edge of thee graph. (Proof: Independent Set and VC reduce to each other by observing that a subset of vertices, $I$, is an Independent Set if and only if  $V-I$ is a vertex cover).
5. **Integer Linear Program**: Find an integer assignment to the variables that maximizes a given objective function while respecting given constraints.
6. **Clique**: A clique is a set of vertices such that every possible edge between vertices in the set is in the graph. Given a graph $G$ and a number $K$, is there a clique of size at least $K$?
7. **Max Cut**: Given a graph $G$, divide the vertices into 2 sets such that the number of edges crossing the cut is maximized.
8. **Euclidean TSP**: Given $n$ cities in the $x$-$y$ plane, find a tour of minimum length that travels through all the cities.
9. **Max SAT** Find the truth assignment that satisfies the largest number of OR clauses. (A 2-approximation algorithm relies on random coin-flipping).
10. **Minimum Set Cover**: Given a set $S$ and a set of subsets of $S$, find the minimum number of subsets such that the union of those subsets is $S$.

## 3. NP-Complete

A problem is NP-complete if it is both NP-hard and is an element of NP. Informally, NP-complete problems are the hardest problems in NP. A polynomial-time algorithm for even one NP-complete problem would immediately imply a polynomial-time algorithm for every NP-complete problem.

<p align="center">
<img width="350" alt="18" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/9cec12a4-ea78-4a3a-99df-333d2d5121d8">
</p>

#### How to prove a given problem $X$ is NP-complete?
1. Show $X$ is in NP
2. Show $X$ reduces from a known NP-Hard problem (say 3-SAT).


## 4. Selected NP-Hard Problems

### 4.1. Maximal Independent Set

**Independent Set**: An independent set in a graph $G$ is a subset of the vertices of $G$ with no edges between them.

Formally, given a graph $G = (V, E)$, an independent set of $G$ is a subset $I \subseteq V$ such that $\forall e, e \not \subseteq I$ (i.e: no edge has both endpoints in $I$). The independent set problem is that given a graph $G$, and a number $k$, to determine if $G$ has an independent set of size at least $k$.

The following graph of the cube has 6 different independent sets (2 of them are maximum), shown as the red vertices:

<p align="center">
<img width="500" alt="21" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/fd3536bb-86a7-4058-855b-33965c0d3b02">
</p>

**Maximal Independent Set**:  For a graph $G = (V, E)$, an independent set $S$ is a maximal independent set if for $v \in V$, one of the following is true:
1. $v \in S$
2. $N(v) \cap S \neq \emptyset$, where $N(v)$ denotes the neighbors of $v$.

3-SAT reduces to Independent Set via constructing a strange graph where nodes represent assignments of the literals and edges connect assignments that conflict with each other.

### 4.2. Minimum Vertex Cover

**Vertex Cover**: Vertex cover of a graph $G$ is a subset of vertices of $G$ that includes at least one endpoint of every edge of the graph.

Formally, given a graph $G = (V, E)$, a vertex cover of $G$ is a subset $C \subseteq V$ such that all edges in $E$ have at least one endpoint in $C$. The vertex cover problem is that given a graph $G$, and a number $k$, to determine if $G$ has a vertex cover of size at most $k$.

*We can think of a vertex cover as polices who have an eye on any passage (edges). By this, they can have an eye on any node except the isolated ones because nodes are not their concerns. They must cover all passages.*

Following are two vertex cover examples:

<p align="center">
<img width="300" alt="19" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/d85ae15b-b5f6-42e7-b79c-271e30302cea">
</p>

**Minimum Vertex Cover**: Given a graph $G= (V, E)$, find the minimum set of vertices $S \subseteq V$ such that for all $(u, v) \in E$, we have at least one of $u\in S$ or $v \in S$.

Following are two minimum vertex cover examples:

<p align="center">
<img width="300" alt="20" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/2c66357b-a852-4f11-9f2d-25df618f9d90">
</p>

Independent Set and Vertex Cover reduce to each other by observing that $C$ is an independent set if and only if $V-C$ is a vertex cover. Since Independent Set is NP-Complete, it follows that Vertex Cover is also NP-Complete.


### 4.3. Minimal Dominating Set

**Dominating Set**: Dominating set for a graph $G = (V, E)$ is a subset $D$ of $V$ such that every vertex not in $D$ is adjacent to at least one member of $D$.

Formally, given an undirected graph $G = (V, E)$, a subset of vertices $D \subseteq V$ is called a **dominating set** if for every vertex $u \in V - D$, there is a vertex $v \in D$ such that $(u, v) \in E$.

*We can think of a dominating set as polices who have an eye on any node. The passages aren't important, so if one of them monitors a node via an edge, the other edges connected to that node may not be covered because the passages are not the concern of these polices.*

<p align="center">
<img width="500" alt="22" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/7a959e61-0812-4e97-af17-b23d79c4a826">
</p>

Dominating sets are closely related to independent sets: an independent set is also a dominating set if and only if it is a maximal independent set, so any maximal independent set in a graph is necessarily also a minimal dominating set.


### 4.4. Maximum Cut

**Maximum Cut**: Given a graph $G = (V, E)$, find two disjoint subsets $S$ and $T$ such that $S \cap T = \emptyset$, $S \cup T = V$, and the number of $(u,v) \in E$ that cross the cut is maximized.

Following is an example of a maximum cut:

<p align="center">
<img width="180" alt="23" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/31988ea6-a4ae-4008-bcc7-0c42f5a33863">
</p>


## 5. Reductions

To prove that any problem other than circuit satisfiability is NP-hard, we use a reduction argument. 

$$
\boxed{\color{red}{\text{To prove that problem } A \text{ is NP-hard, reduce a known NP-hard problem to } A.}}
$$

Reducing problem $A$ to another problem $B$ means describing an algorithm to solve problem $A$ under the assumption that an algorithm for problem $B$ already exists.

### 5.1. Maximum Independent Set (from 3SAT)

The maximum independent set problem asks for the size of the largest independent set in a given graph. We shall prove that maximum independent set problem is NP-hard using a reduction from 3-SAT.

Given an arbitrary 3CNF formula $\Phi$, we construct a graph $G$ as follows.

Let $k$ denote the number of clauses in $\Phi$. The graph $G$ contains exactly $3k$ vertices, one for each literal in $\Phi$.

Two vertices in $G$ are connected by an edge if and only if either
1. they correspond to literals in the same clause, or
2. they correspond to a variable and its inverse.

For example, the formula $(a \lor b \lor c) \land (b \lor \neg{c} \lor \neg{d}) \land (\neg{a} \lor c \lor d) \land (a \lor \neg{b} \lor \neg{d})$ is transformed into the following graph:

<p align="center">
<img width="450" alt="24" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/fb75bdf7-d0ea-4b44-bf09-9d8c4a913223">
</p>

Each independent set in $G$ contains at most one vertex from each clause triangle, because any two vertices in each triangle are connected. Thus, the largest independent set in $G$ has size at most $k$. 

We claim that $G$ contains an independent set of size exactly $k$ if and only if the original formula $\Phi$ is satisfiable. As usual for “if and only if” statements, the proof consists of two parts.

Let's consider  the forward direction. Suppose $\Phi$ is satisfiable. Fix an arbitrary satisfying assignment. By definition, each clause in $\Phi$ contains at least one TRUE literal. So, we can choose a subset $S$ of $k$ vertices in $G$ that contains exactly one vertex per clause triangle, such that the corresponding $k$ literals are all TRUE. Because each triangle contains at most one vertex in $S$, no two vertices in $S$ are connected by a triangle edge. Because every literal corresponding to a vertex in $S$ is TRUE, no two vertices in $S$ are connected by a negation edge. We conclude that $S$ is an independent set of size $k$ in $G$.

Let's consider the backward direction. Suppose $G$ contains an independent set $S$ of size $k$. Each vertex in $S$ must lie in a different clause triangle. Suppose we assign the value TRUE to each literal in $S$; because contradictory literals are connected by edges, this assignment is consistent. There may be variables $x$ such that neither $x$ nor $\neg{x}$ corresponds to a vertex in $S$; we can set these variables to any value we like. Because $S$ contains one vertex in each clause triangle, each clause in $\Phi$ contains (at least) one TRUE literal. We conclude that $\Phi$ is satisfiable.

Transforming the 3CNF formula $\Phi$ into the graph $G$ takes polynomial time. Therefore, if we could solve the Maximum Independent Set problem in polynomial time, then we could also solve 3-SAT in polynomial time. But that would imply P = NP, which is ridiculous! We conclude that the Maximum Independent Set problem is NP-hard.

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
Return C
```

The above algorithm for vertex cover does the following: repeatedly choose an edge, and include both of its endpoints into the cover. Throw the vertices and its adjacent edges out of the graph, and continue.

**Theorem**: Algorithm VC has approximation ratio 2.

*Proof*: Clearly VC is a vertex cover. Next let us prove the ratio. Suppose we pick $k$ edges during the execution of algorithm VC. These $k$ edges form a matching (they don’t share vertices). So, the optimal vertex cover should contain at least one vertex from each of these $k$ edges. Thus $OPT \geq k$.  On the other hand, algorithm VC’s output has size at most $2k$.


## 2. Maximum Independent Set

Let $G = (V, E)$ be a graph. An independent set $V'$ is a subset of $V$ such that no edge connects two vertices in $V'$.

**Algorithm MIS**

```
S <- Empty Set
while G is not empty
  Let v be a node of minimum degree in G
  S <- S U {v}
  Remove v and its neighbors from G
Return S
```

**Theorem**: Algorithm MIS has approximation ratio $1+\Delta$, where $\Delta$ is the maximum degree of any node in the graph. In other words, $\|S\| \geq \|\text{OPT}\|/{(1 + \Delta)}$.

*Proof*: Let $V$ be the set of vertices of $G$ To show that $\|S\| \geq \|\text{OPT}\|/{(1 + \Delta)}$,  we only need to show
$\|S\| \geq \|V\|/{(1 + \Delta)}$.

For each vertex $v \in V - S$, it is removed in the algorithm because some other vertex $u$ is put into $S$. Note that $v$must be a neighbor of $u$ in this case. Charge $v$ to $u$. Therefore, the size of $V-S$ satisfies $\|V - S \| = \|V \| - \|S\| \leq \Delta \|S\|$,
which implies $\|V\| \leq (1 + \Delta ) \|S \|$. So,  $\|S\| \geq \|V\|/{(1 + \Delta)} $, which means $\|S\| \geq \|\text{OPT}\|/{(1 + \Delta)}$.


## 3. Maximum Cut

Given a graph $G = (V,E)$, find two disjoint subsets $S$ and $T$ such that $S \cap T = \emptyset, S \cup T = V$, and the number of $(u, v) \in E$ that cross the cut is maximized.

We discuss two **2-approximation algorithms** for this problem.

The first algorithm randomly assigns each $u \in V$ to either $S$ or $T$ , such that each edge has a 1/2 probability of crossing the cut, leading to an average outcome of 1/2 of the edges in the graph crossing the cut, which is 1/2 of the optimal solution (every edge crosses the cut).

The second algorithm begins with all vertices on one side of the cut, and deterministically switches a vertex to the other side if it increases the number of edges crossing the cut until the size of the cut can no longer be increased in this manner. This type of algorithm is a local search algorithm, and also results in a 1/2-approximation.


## 3. Euclidean Traveling Salesman Problem

In the Euclidean Traveling Salesman Problem, we are given $n$ points (cities) in the $x$-$y$ plane, and we seek the tour (cycle) of minimum length that travels through all the cities. This problem is NP-complete

A greedy algorithm for this problem is to run DFS on the minimum spanning tree and skipping vertices that have already been visited (i.e. shortcutting). This can be shown to be within a factor of 2 of optimal, since running DFS on the MST visits each edge at most twice, and shortcutting a node can only reduce the travel time due to the triangle inequality, plus we know that the optimal tour is at least the size of the MST since any tour must be a spanning tree (with an additional edge for the final leg back to the origin). That is, if $T$ is the length of the MST, then we have:

$$
\text{tour}_{\text{greedy}} \leq 2T (\text{after shortcutting}) \leq 2\text{OPT},
$$

so this is a 2-approximation algorithm for Euclidean TSP. With some more work, we can improve the bound to a 3/2-approximation algorithm, which is known as the Christofides–Serdyukov algorithm.

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

***
# Problems

1. Which of the following can we infer from the fact that the traveling salesperson problem is NP-complete, if we assume that P is not equal to NP?
   1. There does not exist an algorithm that solves arbitrary instances of the TSP problem.
   2. There does not exist an algorithm that efficiently solves arbitrary instances of the TSP problem.
   3. There exists an algorithm that efficiently solves arbitrary instances of the TSP problem, but no one has been able to find it.
   4. The TSP is not in P.
   5. All algorithms that are guaranteed to solve the TSP run in polynomial time for some family of input points.
   6. All algorithms that are guaranteed to solve the TSP run in exponential time for all families of input points.
2. Which of the following can we infer from the fact that the PRIMALITY problem is in NP but not known to be NP-complete, if we assume that P is not equal to NP?
   1. There exists an algorithm that solves arbitrary instances of PRIMALITY.
   2. There exists an algorithm that efficiently solves arbitary instances of PRIMALITY.
   3. If we found an efficient algorithm for PRIMALITY, we could immediately use it as a black box to solve TSP.
3. Which of the following are NP-complete?
   1. The brute force TSP algorithm.
   2. The quicksort algorithm for sorting.
   3. The Halting problem.
   4. Hilbert's 10th problem.
4. Let X and Y be two decision problems.  Suppose we know that X reduces Y. Which of the following can we infer? 
   1. If Y is NP-complete then so is X.
   2. If X is NP-complete then so is Y.
   3. If Y is NP-complete and X is in NP then X is NP-complete.
   4. If X is NP-complete and Y is in NP then Y is NP-complete
   5. X and Y can't both be NP-complete.
   6. If X is in P, then Y is in P.
   7. If Y is in P, then X is in P.

### Answers

1. We can infer (2) and (4) only
   1. The brute force TSP algorithm always works. (It's just painfully slow.)
   2. If P != NP, then there does not exist an efficient algorithm for any NP-complete problem, including TSP.
   3. We could infer this if P = NP.
   4. If P != NP, then no NP-complete problem can be in P.
   5. The brute force TSP algorithm always takes $N!$ steps to solve a problem with $N$ points. This is not polynomial.
   6. There may be easy instances. E.g., if all the TSP points lie on a line (or the boundary of a circle).
2. (1) only
   1. All problem in NP are solvable.
   2. There are problems in NP that are neither in P or NP-complete (assuming P != NP). PRIMALITY could be one of them.
   3. This cannot be inferred since we don't know if PRIMALITY is NP-complete.
3. None. NP-completeness deals with **problems** not specific algorithm for problems. The Halting problem and Hilbert's 10th problem are undecidable, so they are not in NP (and all NP-complete problems are in NP).
4. (4) and (7) only.
   X reduces to Y means that if you had a black box to solve Y efficiently, you could use
    it to solve X efficiently. X is no harder than Y.

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)


