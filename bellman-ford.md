
# Bellman-Ford Algorithm

## Single Source Shortest Path

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

We walk through the algorithm in steps as shown below:

(1) Initialize $d[]$ and $\pi[]$:
   
<img width="600" alt="bf2" src="https://github.com/user-attachments/assets/815a186d-ce59-4158-a60c-5579be8bb9bd">

(2) First iteration: 1 hop from $A$
   
<img width="600" alt="bf3" src="https://github.com/user-attachments/assets/555796a8-3b95-4875-8192-b5614a5d9d55">

(3) Second iteration: 2 hops from $A$
   
<img width="700" alt="bf4" src="https://github.com/user-attachments/assets/7e8b9bec-a196-4db1-82f5-04280d9710d4">
   
(4) Third iteration: 3 hops from $A$

<img width="600" alt="bf5" src="https://github.com/user-attachments/assets/10556230-ee9d-4f21-a30d-fff5890c2eab">

(5) Fourth iteration: 4 hops from $A$

Algorithm terminates!
1. The 4 hops from $A$ are: $A \rightarrow B \rightarrow D \rightarrow E \rightarrow C$, and $A \rightarrow B \rightarrow D \rightarrow C \rightarrow E$. Both of them don't provide smaller values for $C$ or $E$.
2. So, no more edges to relax. The $d$ array contains the shortest path distance and the $\pi$ array provides the shortest path.

  <img width="600" alt="bf6" src="https://github.com/user-attachments/assets/969d51cf-aae5-4929-88cf-9487eb779a09">

## Negative Cycle Detection

**What is a negative cycle?** A negative-weight cycle is a cycle in a graph whose edges sum to a negative value.

**Steps**
1. Run Bellman-Ford as above
2. Run the inner loop once more: i.e: for every edge $(u, v) \in E$, call `update`$(u,v)$
3. If any of the $d[\cdot]$ changes, then the graph has a negative cycle.

**Run-time**: Run-time is still $O(\|V\|\|E\|)$.

**Claim**: If you run Bellman-Ford for $n$ rounds, there a change in $d[\cdot]$ iff graph has a negative cycle.

*Proof*: 
1. Assume there is no negative cycle. Therefore the shortest walks from $s$ to $v$ are paths. Paths have length at most $n-1$. So, $n-1$ updates suffice and no updates required on the $n$th round.
2. Assume $\exists$ a negative cycle.
  - After infinitely many rounds of updates, every $d[v] \rightarrow -\infty$
  - So, there must exist a round $> n-1$ with an update
  - But no update in round $i$ implies no further update
  - So every round (including the $n$th) must have an update

>Example: Check for negative cycle in the following graph.
>
><img width="295" alt="bf_negative_cycle" src="https://github.com/user-attachments/assets/85d1e238-9782-4888-8e29-c694c358f24d">

The following diagram shows the shortest distances in red after the 4th iteration:

<img width="265" alt="bf_negative_cycle_4th_iteration" src="https://github.com/user-attachments/assets/f48edcb0-eb7d-4e22-bfd5-eb332f3ced89">

The following diagram shows the shortest distances in red on the 5th iteration:

<img width="265" alt="bf_negative_cycle_5th_iteration" src="https://github.com/user-attachments/assets/1b1b9d75-2bae-4335-855a-30b84408bf04">

The 5-hop walk $A \rightarrow C  \rightarrow B  \rightarrow D  \rightarrow C  \rightarrow B$ updates $d[B]$ again. Therefore, Bellman-Ford has detected a cycle in this graph!

[Back to Graph Algorithms](./graph.md)

[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
