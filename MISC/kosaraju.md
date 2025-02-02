### Kosaraju's Algorithm for Finding Stongly Connected Components (SCC)

This is an application of DFS.

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

```python
def transpose(G):
    G_R = defaultdict(list)
    for u in G.keys():
        for v in G[u]:
            addEdge(G_R, v, u)
    return G_R
```

Following is the complete Python code:

```python
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

```python
def dfs2(G, vList, explored):
    for v in vList:
        if v not in explored:
            search(G, v, explored)
            stack.append("\nNew SCC: ")
```

Following is the rest of the Python code:

```python
## Now run DFS on G using the new vList created on G_R above
## Run DFS on G
# Initialize stack and explored
stack = []                # stack is represented as a list
explored = set()          # explored is a set containing visited vertices
dfs2(G, vList, explored) # Run DFS on G_R
printStack(stack)         # Print out the post-order vists
```



* * *
###### anusha-murali.github.io


<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
