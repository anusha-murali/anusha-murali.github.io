# Breadth First Search

BFS is a simple alternate to the DFS strategy to exploring a graph. BFS first "explores" all the vertices that are one hop away from the source vertex. Then it explores all the vertices that are two hops away from the source vertex and so on. In other words, BFS visits vertices in order of increasing hop-count from the source vertex. 

If each edge has unit length, then the number of hops equals the distance of a vertex from the source vertex. Therefore, we can use BFS to solve the shortest path problem.

Following is the pseduocode of BFS.

```
def BFS(G, s):
  for all v in V:
    d[v] <- infty; explored[v] <- 0
  Q = []; explored[s] <- 1; d[s] <- 0; pi[s] <- null
  enqueue(Q, s)
  while Q is not empty:
    v <- dequeue(Q)
    previsit(v)
    for (v, w) in E:
      if not explored[w]:
        explored[w] <- 1; d[w] = d[v] + 1; pi[w] <- v
        enqueue(Q, w)
  return d, pi
```

We use the queue data structure to implement BFS.

**Run-time**: In the worst case, we will visit every vertex and every edge. So the run-time is $O(\|V\| + \|E\|)$.

>Example: Find the shortest distance from vertex $A$ to each other vertices in the graph as well as the path that results in the shortest distance
><img width="331" alt="bfs" src="https://github.com/user-attachments/assets/77a505cc-7d06-4bb9-84ae-d7bcd0b5b984">
>
[BFS Problems](./bfs_problems.md)

[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
