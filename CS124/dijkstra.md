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
def dijkstra(G, s, w):
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
The following binary heap represents a Min-Heap, which has the min-heap property where for every node $k$ other than the root, we have $A[\text{Parent}(k)] \leq A[k]$. Therefore, the smallest element in a Min-Heap is stored at the root, and the subtree rooted at a node contains values no smaller than that contained in the node itself. 

The Min-Heap data structure, although is an array object, can be viewed as a binary tree as shown in the figure below:
<p align="center">
<img width="408" alt="minheap" src="https://github.com/user-attachments/assets/89e17549-0729-4344-992b-cccbc5f58ab4">
</p>
The array representation of the Min-Heap is shown below:
<p align="center">
<img width="400" alt="minheap2" src="https://github.com/user-attachments/assets/3a421962-db9b-419b-83d5-487f72a811c3">
</p>
The array representation allows us to access a node's parent and children in $O(1)$ time. If the index of a non-root node is $k$, then the index of its parent is $\lfloor k/2 \rfloor$, and the indices of its left and right children, if they exist, are $2k$ and $2k+1$ respectively.

The Min-Heap data structure is available in Python using the **heapq** module. 

Following Python implementation of Dijkstra's algorithm verifies the results of the example presented earlier. It uses Python's **heapq** module.

```
from collections import defaultdict
import heapq

def dijkstra(G, s):
    d = defaultdict(lambda: float('inf'))    # Initialize all d's to infinity
    pi = defaultdict(str)
    PQ = []
    d[s] = 0                                
    heapq.heappush(PQ, (0, s))   # Insert distance from source and v into PQ
    while PQ:
        _, u = heapq.heappop(PQ) # DeleteMin()
        for v, weight in G[u]:
            if d[v] > d[u] + weight:
                d[v] = d[u] + weight
                heapq.heappush(PQ, (d[v], v))  # Insert distance and v into PQ
                pi[v] = u
    return (d, pi)
                
def addEdge(G, u, v, weight):
    G[u].append((v, weight))
    G[v].append((u, weight))

vList = ['A', 'B', 'C', 'D', 'E']
G = defaultdict(list)

addEdge(G, 'A', 'B', 6)
addEdge(G, 'A', 'D', 1)
addEdge(G, 'B', 'C', 5)
addEdge(G, 'B', 'E', 2)
addEdge(G, 'B', 'D', 2)
addEdge(G, 'D', 'E', 1)
addEdge(G, 'C', 'E', 5)

d, pi =  dijkstra(G, 'A')
```
The output of the above code is identical to the results listed in the table in the example earlier.

Dijkstra's algorithm fails for graphs with negative edge weights. 


[Back to Graph Algorithms](./graph.md)

[Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
