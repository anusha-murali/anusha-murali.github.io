# Approximation Algorithms

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


[Table of Contents](./index.md)
<!--
![111596338](https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002)
-->

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>

