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

## Applications of DFS: Topological Sort

**Problem**: Given a directed graph $G = (V, E)$, whose vertices $V = \{v_1, \ldots, v_n\}$ represent tasks, and whose edges represent precedence constraints such that a directed edge from $u$ to $v$ indicates that task $u$ must be completed before $v$, the problem of topological sort is to find the order in which the tasks be scheduled.

**Solution**: First run DFS on $G$ and then sort vertices based on descending post-order numbers.

**Claim**: If the tasks are scheduled by decreasing postorder number, then all precedence constraints are satisfied.

**Proof**: If $(u, v) \in E$, then postorder$(u) >$ postorder$(v)$. Therefore, if we process the tasks in decreasing order of postorder numbers, when task $v$ is processed, all tasks with precedence constraints into $v$ (and therefore higher postorder numbers) must already have been processed.

One of the pre-conditions for topological sort is that that $G$ must be acyclic (DAG).

## Applications of DFS: Finding Stongly Connected Components (SCC)

Call two vertices $u$ and $v$ of a directed graph $G = (V, E)$ *connected* if there is a path from $u$ to $v$, and one from $v$ to $u$. Within a strongly connected component, every pair of vertices are connected.

<p align="center">
  <img width="1083" alt="scc" src="https://github.com/user-attachments/assets/b40c0b5a-2619-40ca-af93-ba056e24086d">
</p>


[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
