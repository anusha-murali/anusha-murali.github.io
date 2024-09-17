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
  H <- {(s, 0)}      # H is a MinHeap
  while H is not empty:
    v <- deleteMin(H)
    for (v, w) in E:
      if d[w] > d[v] + w(v, w):
        d[w] <- d[v] + w(v, w)
        pi[w] <- v
        insert(w, d[w], H)
```

Dijkstra’s algorithm is used to find shortest paths in graphs with any positive edge weights. It uses a heap to determine which node to consider next. When a vertex is popped off the heap, that means we have our final answer for that vertex’s distance and path from the source.

**Run-time**: $O(\|V\| \cdot \text{deleteMin} + \|E\| \cdot \text{insert}$. The running time of Dijkstra’s algorithm depends on the implementation of the heap $H$. For each vertex, we perform a delete min, while for each edge we perform an insertion.

>Example: Run Dijkstra's algorithm on the following graph and find the shortest distances to each vertex from the source vertex, $A$, and give their corresponding shortest path.
>
><img width="250" alt="dijkstra" src="https://github.com/user-attachments/assets/c4bf9eea-fa3e-4222-8ca5-e2f87b1c87b0">

Running Dijkstra's algorithm on the above graph yields the following shortest distances and paths.

| Vertex | $d$    | Path                                        |
| :--: | :---:  | :---                                          |
| $A$  | 0      | Null                                          |
| $B$  | 3      | $A \rightarrow D \rightarrow B$               |
| $C$  | 7      | $A \rightarrow D \rightarrow E \rightarrow C$ |
| $D$  | 1      | $A \rightarrow D$                             |
| $E$  | 2      | $A \rightarrow D \rightarrow E$               |

## Min-Heap

In order to do `deleteMin()` and `insert()` operations efficiently (both in $O(\log n)$ time), we use a binary heap (Min-Heap). Using a Min-Heap leads to a total runtime for Dijkstra of $O(m + n)\log n$.

The (binary) heap data structure is an array object that we can view as a nearly complete binary tree.  Each node of the tree corresponds to an element of the array. The tree is completely filled on all levels except possibly the lowest, which is filled from the left up to a point. 
The following binary heap represents a Min-Heap, which has the min-heap property where for every node $k$ other than the root, we have $A[\text{Parent}(k)] \leq A[i]$.


Following Python implementation of Dijkstra's algorithm verifies the above results.

[Back to Graph Algorithms](./graph.md)

[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
