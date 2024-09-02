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

[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
