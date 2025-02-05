# Minimum Spanning Tree (MST)

**Motivating Problem**

- A town has a set of houses and a set of roads.
- A road connects 2 and only 2 houses.
- A road connecting houses $u$ and $v$ has a repair cost $w(u,v)$.
- ***Goal***: Repair enough (and no more) roads such that
    - everyone stays connected: can reach every house from all other houses, and
    - total repair cost is minimum.

We can model the above problem as a graph:
- Undirected graph $G = (V,E)$.
- ***Weight*** $w(u,v)$ on each edge $(u, v) \in E$.
- Find $T \subset E$ such that
    - $T$ connects all vertices (i.e: $T$ is a ***spanning tree***), and
    - $w(T) = \sum_{(u,v) \in T} w(u,v)$ is minimized.
    


A tree is connected, acyclic, and has $\|V\|-1$ edges (any two implies the third).

A spanning tree is a subgraph of a connected, undirected graph that includes all the vertices of the graph.

A minimum spanning tree (MST) is a subset of the edges of a **connected, edge-weighted undirected graph** that connects all the vertices together without any cycles and with the minimum possible total edge weight.

An MST is a spanning tree whose sum of edge weights is as small as possible.

***Example***: In the following example, there is more than one MST. (Replace edge $(e, f)$ with $(c,e)$).
<p align="center">
<img width="400" alt="mst1" src="https://github.com/user-attachments/assets/a297bfa8-7506-4aec-ab46-6556971ea4ab" />
</p>

**Properties of an MST**
- It has $\|V\|-1$ edges
- It has no cycles
- It may not be unique

**Building an MST**
- Build a set $A$ of edges
- Initially, $A$ has no edges.
- As edges are added to $A$, maintain a **loop invariant**:
  - **Loop invariant**: $A$ is a subset of some MST.
- Add only edges that maintain the invariant. If $A$ is a subset of some MST, an edge $(u,v)$ is ***safe*** for $A$ if and only if $A \cup \{(u,v)\}$ is also a subset of some MST. So, add only safe edges.

### Generic MST Algorithm

```python
    def genericMST(G, w)
        A = []
        while A does not form a spanning tree:
            find an edge (u,v) that is safe for A
            A.append({u,v})
        return A
```
We can use the loop invariant to show that this generic algorithm works.

- **Initialization**: The empty set trivially satisfies the loop invariant.
- **Maintenance**: Since only safe edges are added, $A$ remains a subset of some MST.
- **Termination**: The loop must terminate by the time it considers all edges. All edges added to $A$ are in an MST, so upon termination. $A$ is a spanning tree that is also an MST.

**Cut Property**: For any cut of a connected, undirected graph, the minimum weight edge that crosses the cut belongs to MST.

Two popular algorithms for finding MST in a graph are:
1. [Kruskal's MST Algorithm](./kruskal.md)
2. [Prim's MST Algorithm](./prim.md)

[Back to Greedy Algorithms](./greedy.md)

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)

