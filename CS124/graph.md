# Graph Algorithms

A graph $G = (V, E)$ can be represented in two standard ways, namely via the *adjacency matrix* or via the *adjacency list*.

The *adjacency matrix* for $G = (V, E)$ is an $n \times n$ matrix $A$, where the entry $a_{i,j} = 1$ if $(i, j) \in E$ and $a_{i, j} = 0$ otherwise. The advantage of the adjacency matrix representation is that it takes $O(1)$ (i.e: constant time) to determine whether or not there is an edge between two arbitrary vertices $i$ and $j$. However, the adjacency matrix representation requires $\Omega(n^2)$ storage even if the graph has as few as $O(n)$ edges.

The *adjacency list* for $G = (V, E)$ contains $n = \|V\|$ number of adjacency lists, which can be represented by an array of size $n$. The adjacency list for a vertex $i$ (which corresponds to the $i$th index of the array) is a list of all the vertices adjacent to $i$ (in any order). Therefore, the total storage used by an adjacency list representation of a graph with n vertices and m edges is $O(n + m)$. However, the major disadvantage of adjacency list is that determining whether there is an edge from vertex $i$ to vertex $j$ may take as many as $n$ steps, since there is no systematic shortcut to scanning the adjacency list of vertex $i$. 

There are two fundamental algorithms for searching a graph: *depth-first search* (DFS) and *breadth-first search* (BFS).

## 1. Depth First Search

DFS is a fundamental technique for exploring a graph using a stack as the basic data structure. It has the following applications:
1. Traversing/searching a graph: From a given source vertex to the target vertex
2. Cycle detection: Encounter a visited node or terminate without finding one
3. Topological sort of DAG: Schedule tasks according to their precedence constraints

**[Depth First Search](./dfs.md)**

## 2. Breadth First Search

BFS is a fundamental technique for exploring a graph using a queue as the basic data structure. It is applicable only when all edges are of length 1. It has the following applications:
1. Traversing/searching a graph: From a given source vertex to the target vertex
2. Single Source Shortest Path (SSSP) when all edges have the same weight

**[Breadth First Search](./bfs.md)**

## 3. Dijkstra's Algorithm

Dijkstra's algorithm allows us to find the shortest paths when the edge lengths are non-negatives. Dijkstra’s algorithm will initially start with infinite distances and will try to improve them step by step.

Dijkstra’s algorithm fails for graphs with negative edge weights.

**[Dijkstra's Algorithm](./dijkstra.md)**

## 4. Bellman-Ford Algorithm

Bellman-Ford algorithm is useful for finding the single source shortest path when the graph has negative edge weights (of course, finding shortest path does not make any sense in the presence of negative cycles!). It has the following applications:
1. Single source shortest path: Finding the shortest path to every node from a given source node
2. Detecting negative cycles

**[Bellman-Ford Algorithm](./bellman-ford.md)**


[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
