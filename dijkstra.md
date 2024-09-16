# Dijkstra's Algorithm

Dijkstra’s algorithm finds the shortest paths between nodes in a weighted graph. Following is the description of the algorithm.

1. Mark all vertices as *unvisited*. Also initialize the distance of each vertex from the source vertex to $\infty$, but initialize this distance to 0 for the source vertex.
2. When at a given vertex, consider all of its unvisited neighbors and calculate their distances *through the current vertex*. Compare the newly calculated distance to the current value and update it if the newly calculated distance is smaller. (For example, if the distance to the current vertex $A$ is 5 and the length of the edge $A-B$ is 2, then the newly calculated distance from the source to $B$ via $A$ is 5 + 2 = 7. Suppose, $B$ was previously marked with a larger value (say 9), then update it to 7. Otherwise, do not update it.
3. When we are done considering all of the unvisited neighbors of the current vertex, mark the current vertex as visited and remove it from the unvisited set.
4. If the destination vertex has been marked visited (when planning a route between two specific vertices)
or if the smallest tentative distance among the vertices in the unvisited set is infinity (when planning a complete traversal), then stop. The algorithm has finished.
5. Otherwise, select the unvisited vertex that is marked with the smallest tentative distance, set it as the new current vertex, and go back to step 2.

The following pseudocode implements the above steps.

```
def Dijkstra(G, s, w):
  for all v in V:
    d[v] <- infty; pi[s] <- null
  d[s] = 0
```

[Back to Graph Algorithms](./graph.md)

[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>