
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

>Example: Find the shortest path to all other nodes from node $A$.
>
><img width="243" alt="bf1" src="https://github.com/user-attachments/assets/e9970bc1-1eea-4b2b-af59-fa96ec22a0d4">
>

(1) Initialize $d[]$ and $\pi[]$:
   
<img width="600" alt="bf2" src="https://github.com/user-attachments/assets/815a186d-ce59-4158-a60c-5579be8bb9bd">

(2) First iteration: 1 hop from $A$ adfaf
   
<img width="600" alt="bf3" src="https://github.com/user-attachments/assets/555796a8-3b95-4875-8192-b5614a5d9d55">

(3) Second iteration: 2 hops from $A$
   
<img width="700" alt="bf4" src="https://github.com/user-attachments/assets/7e8b9bec-a196-4db1-82f5-04280d9710d4">
   
(4) Third iteration: 3 hops from $A$

<img width="600" alt="bf5" src="https://github.com/user-attachments/assets/10556230-ee9d-4f21-a30d-fff5890c2eab">

(5) Fourth iteration: 4 hops from $A$

**Algorithm terminates**
1. The 4 hops from $A$ are: $A \rightarrow B \rightarrow D \rightarrow E \rightarrow C$, and $A \rightarrow B \rightarrow D \rightarrow C \rightarrow E$. Both of them don't provide smaller values for $C$ or $E$.
2. So, no more edges to relax.

[Back to Graph Algorithms](./graph.md)

[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
