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

Following is a minimalistic and fully-functional code in Python, which prints out DFS in decreasing post-order number:

Whenever we visit a vertex for the first time, we add it to a set called `explored`. When we return to the vertex, after visiting all of its neighbors recursively, we push it to a stack. The position of the vertex in the stack tells us its post-order number.

```
def search(G, v, explored):
    explored.add(v)
    for neighbor in G[v]:
        if neighbor not in explored:
            search(G, neighbor, explored)
    stack.append(v)
```
The main call to `dfs()` assumes that the vertices of $G$ are found in a list, `vList`.

```
def dfs(G, vList, explored):
    for v in vList:
        if v not in explored:
            search(G, v, explored)
```

We represent the graph, $G$, as a dictionary, in which a key denotes a vertex and its corresponding value represents its immediate neighbors. The following function `addEdge()` adds an edge to $G$.

```
def addEdge(G, u, v):
    G[u].append(v)
```

The following function, `printStack()` prints the stack from top to bottom, which prints the DFS visit:

```
def printStack(stack):
  while len(stack) > 0:
      print(stack.pop(), end=' ')
```

Let us use the above functions to run DFS on the following example:

>Example: Run DFS on the following graph and print out the order in which the vertices are visited in postorder.
>
><img width="220" alt="dfs_1" src="https://github.com/user-attachments/assets/be33e775-668a-4eda-8956-11de1f81e5e4">
>

```
from collections import defaultdict
# Create graph G
vList = ['A', 'B', 'C', 'D', 'E']
G = defaultdict(list)
addEdge(G, 'A', 'B')
addEdge(G, 'A', 'C')
addEdge(G, 'A', 'D')
addEdge(G, 'C', 'E')

# Initialize stack and explored
stack = []              # stack is represented as a list
explored = set()        # explored is a set containing visited vertices
dfs(G, vList, explored) # Run DFS
printStack(stack)       # Print out the post-order vists
```

The call to `printStack()` above prints out the DFS in postorder as: $A, D, C, E, B$. 

The preorder and postorder numbers of the above DFS traversal are shown next to each vertices in the diagram below:

<img width="280" alt="dfs_2" src="https://github.com/user-attachments/assets/bc2718f5-2e41-4d12-906f-0b2aee624442">



## Applications of DFS: Topological Sort

**Problem**: You have a list of tasks; some tasks must be done before others. How to order them?

Formally, the problem is defined using a "precedence graph" $G$ as follows.

Given a directed graph $G = (V, E)$, whose vertices $V = \{v_1, \ldots, v_n\}$ represent tasks, and whose edges represent precedence constraints such that a directed edge from $u$ to $v$ indicates that task $u$ must be completed before $v$, the problem of topological sort is to find the order in which the tasks be scheduled.

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

The decomposition of an arbitrary directed graph into SCC's is extremely useful and informative.

**Kosaraju's algorithm** is an efficient algorithm, based on DFS, which finds the SCC's in linear time.

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

Therefore, the SCC's of $G$ are (1) $\{E, G, F\}$ and (2) $\{A, B, C, D\}$.

We can verify the above results using the Python code that we wrote earlier. All what we need in addition is a function to reverse the edges of the original graph $G$. The function `transpose()` below returns $G^R$, which represents $G$ with its edges reversed.

```
def transpose(G):
    G_R = defaultdict(list)
    for u in G.keys():
        for v in G[u]:
            addEdge(G_R, v, u)
    return G_R
```

Following is the complete Python code:

```
from collections import defaultdict
# Create graph G
vList = ['A', 'B', 'C', 'D', 'E', 'F', 'G']
G = defaultdict(list)
addEdge(G, 'A', 'B')
addEdge(G, 'B', 'C')
addEdge(G, 'C', 'D')
addEdge(G, 'D', 'A')
addEdge(G, 'C', 'E')
addEdge(G, 'E', 'G')
addEdge(G, 'G', 'F')
addEdge(G, 'F', 'E')

# Reverse the edges of G
G_R = transpose(G)

## Run DFS on G_R
# Initialize stack and explored
stack = []                # stack is represented as a list
explored = set()          # explored is a set containing visited vertices
dfs(G_R, vList, explored) # Run DFS on G_R

## Create a new vList using the postorder DFS traversal on G_R above
vList = []
while len(stack) > 0:
    vList.append(stack.pop())
```

In order to print each SCC on a new line, we make the following minor modification to our  `dfs()` function as follows:

```
def dfs2(G, vList, explored):
    for v in vList:
        if v not in explored:
            search(G, v, explored)
            stack.append("\nNew SCC: ")
```

Following is the rest of the Python code:

```
## Now run DFS on G using the new vList created on G_R above
## Run DFS on G
# Initialize stack and explored
stack = []                # stack is represented as a list
explored = set()          # explored is a set containing visited vertices
dfs2(G, vList, explored) # Run DFS on G_R
printStack(stack)         # Print out the post-order vists
```

## Applications of DFS: Detecting Cycles

Run DFS on the graph until it finds a back edge or terminates without finding one. 

**How do we find if there is a back-edge during DFS?** 

During DFS traversal, let us add vertices to the stack during postorder visit.  Each time when we add a vertex $v$ to the stack, we must check whether $v$'s parent is already in the stack. If $v$'s parent is already in the stack, adding $v$ to the stack will introduce a back-edge, and therefore a cycle.

> Example: Is there a cycle in the following graph?
> <p align="center"><img width="220" alt="cycle" src="https://github.com/user-attachments/assets/72bdf5ae-a4b1-475a-a3b8-d0abadc5f0fb"></p>

In the above graph, during DFS of the above graph, we first add $C$, then add $B$ and finally add $A$ to the stack. When we add $A$, we find that $A$'s parent, $C$, is already in the stack. So, we have detected a cycle!


Following Python code implements cycle detection using DFS. We use a helper function called `parentInStack()`, which looks in the current stack for the parent of the current vertex being added to the stack.

```
def parentInStack(G, v):
    global hasCycle             # hasCycle is a global boolean
    for vertex in stack:
        if v in G[vertex]:      # Is v a child of vertex? 
            hasCycle = True     # Found a back-edge
            return True
    return False
```

We make minor modification to our original `search()` function so that it can immediately return upon finding a cycle.

```
def search(G, v, explored):
    if hasCycle:
        return
    explored.add(v)
    for neighbor in G[v]:
        if neighbor not in explored:
            search(G, neighbor, explored)
    if not parentInStack(G, v):
        stack.append(v)
```

The following is the remainder of the code:

```
def dfs(G, vList, explored):
    for v in vList:
        if v not in explored:
            search(G, v, explored)

def addEdge(G, u, v):
    G[u].append(v)

from collections import defaultdict

# Create graph G
vList = ['A', 'B', 'C']
G = defaultdict(list)
addEdge(G, 'A', 'B')
addEdge(G, 'B', 'C')
addEdge(G, 'C', 'A')

# Initialize stack and explored
stack = []              # Stack is represented as a list
explored = set()        # explored is a set containing visited vertices
hasCycle = False        # Global variable
dfs(G, vList, explored) # Run DFS

if hasCycle:
    print("Cycle detected!")
else:
    print("No cycle detected!")
```

[DFS Problems](./dfs_problems.md)

[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
