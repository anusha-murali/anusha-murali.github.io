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


[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
