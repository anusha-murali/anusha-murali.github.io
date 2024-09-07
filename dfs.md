# Depth-First Search (DFS)

DFS is a technique for exploring a graph using a stack as the basic data structure.

We first define a recursive helper procedure called `search()`. 
```
def search(v):
  explored(v) = 1
  pre-visit(v)           # Push v onto stack
  for edge (v, w) in E:
    if explored(w) == 0:
      search(w)
  post-visit(v)          # Pop v off stack
```

We then define the actual DFS() as follows:
```
def DFS(G):
  for vertex v in V:
    explored(v) = 0
  for vertex v in V:
    if explored(v) == 0:
      search(v)
```
By designing `pre-visit()` and `post-visit()` appropriately, we can use DFS to solve various important problems.

**Run-time** Assuming both `pre-visit()` and `post-visit()` take $O(1)$ time, `DFS()` takes $O(\|V\| + \|E\|)$ time.

**Pre-order and Post-order Numbers** If we think of DFS as using an explicit stack, then the pre-order number is assigned when the vertex is first placed on the stack, and the post-order number is assigned when the vertex is removed from the stack.

Following is an example in Python, which prints out DFS in decreasing post-order number:

Whenever we visit a vertex for the first time, we add it to a set called `explored`. When we return to the vertex, after visiting all of its neighbors recursively, we push it to a stack. The position of the vertex in the stack tells us its post-order number.

```
def search(G, v, explored):
    explored.add(v)
    for neighbor in G[v]:
        if neighbor not in explored:
            search(G, neighbor, explored)
    stack.append(v)
```

## Applications of DFS: Topological Sort

**Problem**: Given a directed graph $G = (V, E)$, whose vertices $V = \{v_1, \ldots, v_n\}$ represent tasks, and whose edges represent precedence constraints such that a directed edge from $u$ to $v$ indicates that task $u$ must be completed before $v$, the problem of topological sort is to find the order in which the tasks be scheduled.

> **Example**: In what order the ingredients should be added to make pomegranate ice cream?
> <p align="center"><img width="300" alt="Pomegranate_Ice_Cream" src="https://github.com/user-attachments/assets/20765bed-28d2-41f3-9627-609181c10676"></p>

**Solution**: First run DFS on $G$ and then sort vertices based on descending post-order numbers.

**Claim**: If the tasks are scheduled by decreasing postorder number, then all precedence constraints are satisfied.

**Proof**: If $(u, v) \in E$, then postorder$(u) >$ postorder$(v)$. Therefore, if we process the tasks in decreasing order of postorder numbers, when task $v$ is processed, all tasks with precedence constraints into $v$ (and therefore higher postorder numbers) must already have been processed.

One of the pre-conditions for topological sort is that that $G$ must be acyclic (DAG).

## Applications of DFS: Finding Stongly Connected Components (SCC)

Call two vertices $u$ and $v$ of a directed graph $G = (V, E)$ *connected* if there is a path from $u$ to $v$, and one from $v$ to $u$. Within a strongly connected component, every pair of vertices are connected.

<p align="center"><img width="1183" alt="scc" src="https://github.com/user-attachments/assets/2560d546-ad8c-4b7a-849c-eb2e49c36a86"> </p>

There are two SCC's in the directed graph on the left above. By shrinking each SCC into a (super) vertex, drawing an (super) edge between the SCC, as shown on the right above, we obtain a DAG.

This important decomposition allows one to think of connectivity information of a directed graph in two levels. At the top level we have a DAG, which has a useful, simple structure. A DAG is guaranteed to have at least one source (a vertex without incoming edges) and a sink (a vertex without outgoing edges). If we want more details, we could look inside a vertex of the DAG to see the full-fledged SCC — a completely connected graph — that lies there.

The decomposition of an arbitrary directed graph into SCC's is extremely useful and informative. **Kosaraju's algorithm** is an efficient algorithm, based on DFS, which finds the SCC's in linear time.

### Kosaraju's Algorithm

Kosaraju's algorithm finds all the SCC's in a graph in linear time. This simple algorithm involves the following two steps:


1. Perform DFS on $G^R$.
2. Perform DFS on $G$, processing unsearched vertices in the order of decreasing postorder numbers from the DFS on Step 1 above. At the beginning and every restart, print "New SCC:". When visiting vertex $v$, print $v$.

> **Example**: Find all the strongly connected components in the following graph.
> <p align="center">
  <img width="300" alt="scc2" src="https://github.com/user-attachments/assets/6b574f2f-060f-4449-9ce7-7aba139175b1"> </p>

**Step 1**: Perform DFS on $G^R$

<p align="center">
  <img width="330" alt="scc3" src="https://github.com/user-attachments/assets/99c38018-38c6-44fc-b647-8a2fe4affdef">
</p>
The pair of numbers next to each vertex indicates the preorder and postorder numbers. Therefore, enumerating the vertices in decreasing postorder numbers, we obtain the following:

$$
E, F, G, A, D, C, B.
$$

**Step 2**: Perform DFS on $G$, processing unsearched vertices in the order of decreasing postorder numbers from Step 1:

New SCC: $E, G, F$

New SCC: $A, B, C, D$.

Therefore, the SCC's of $G$ are (1) $\{E, F, G\}$ and (2) $\{A, B, C, D\}$.

[DFS Problems](./dfs_problems.md)

[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
