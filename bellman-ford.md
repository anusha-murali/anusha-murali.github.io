
# Bellman-Ford Algorithm

The Bellman-Ford algorithm allows us to find the shortest paths with arbitrary edge weights. We decrease $d[v]$ only when the current value of $d[v]$ is greater than  $d[u] + \text{length}(u,v)$. Whenever we updae $d[v]$, we also save its parent node. 
```
def update (u,v):
   if d[v] > d[u] + length(u,v):
      d[v] = d[u] + length(u,v)
      prev[v] = u               # Remember the previous node
```
The algorithm maintains the distance of a vertex so that it is always a conservative overestimate; it will only update the a
value when a suitable path is discovered to show that the overestimate can be lowered.

The following is the pseudocode for Bellman-Ford:
```
def bellman_ford(G, s):
   for all v in V:
      d[v] <- infty; pi[s] <- null
   d[s] = 0
   for i in range(n-1):
      for (v, w) in E:
         update(v, w)
   return (d, pi)
```

**Notes**:
1. How many times we should update? $n-1$ times
2. What is the order in which we should consider the edges? Any arbitrary order
3. After $k$ rounds of looking at all edges and updating, all shortest paths with $k$ hops would be found and for a vertex $u$ for whom the shortest path is $k$ hops from $s$
4. Since all paths have length at most $n − 1$ (why?) this implies that after $n − 1$ rounds, we ould have found the shortest paths for all $u$.

[Back to Graph Algorithms](./graph.md)

[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
