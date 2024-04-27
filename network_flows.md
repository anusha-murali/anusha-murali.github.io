# Network Flow

Model a connection of water pipes (a network of roads) as edges with capacity on a directed graph. We want to solve the problem of finding how many units of water (or trucks) can we send from the source to the sink?

## 1. The Ford-Fulkerson Method

**Max-flow Min-cut Theorem**: For every directed graph $G$, the maximum flow on $G$
with capacities $c$ equals the minimum cut in $G$ with capacities $c$.

The minimum cut of the flow network is shown in the following graph. We see that the capacity of the cut  $\\{s, A, D\\}$  and  $\\{B, C, t\\}$  is  $5 + 3 + 2 = 10$ , which is equal to the maximum flow. Other cuts will have a bigger capacity, like the capacity between  $\\{s, A\\}$  and  $\\{B, C, D, t\\}$  is  $4 + 3 + 5 = 12$.

![Cut](https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/fb2d4dc9-9e8d-44ed-a3b5-c36345871528)


If $f$ is a flow in a flow network $G = (V, E)$ with source $s$ and sink $t$,then the following conditions are equivalent:
1. $f$ is a maximum flow in $G$
2. The residual network $G_f$ contains no augmenting paths.
3. $\|f\| = c(S, T)$ for some cut $(S, T)$ of $G$.

Only the following edges can be used for augmentation:
1. Non-null forward edges
2. Non-empty backward edges

Max-flow and min-cut for the graph below is 19. Why?

<img width="400" alt="1" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/db030dff-f39f-4139-9fc8-a7a76efd4118">

We run the Ford-Fulkerson method on the above graph as follows:

We find the path $S-A-B-T$ with the residual capacities of 10, 4, 10. Their minimum is 4, so we can increase the flow along this path by 4. This gives a flows of 4 for the network.

<img width="400" alt="2" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/84959a8e-6f97-4dc3-b03f-3ad7af97d354">

We look for augmenting path again and find that the path $S-A-C-D-T$ with the residual capacities 6, 2, 7, and 8. Their minimum is 2, so we can increase the flow along this path by 2. This gives a total flow to $T$ of 4 + 2 = 6.

<img width="400" alt="3" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/28031b00-f3fc-4eaf-95fe-055850233b4c">



### Run-time

1. Ford-Fulkerson has a run-time of $O(Ef^{\*})$ because each time we augment a path, we increase the total flow, so at worst the number of times we find an augmenting path is $O(f^*)$, where $f^{\*}$ is the value of the max flow. We can find an augmenting path in $O(E)$ with DFS.
2. **Edmond-Karp algorithm**: If we use BFS instead of find our augmenting paths, then can be proved that the run-time is $(O(V E^2)$, which does not depend on $f^{\*}$ anymore.

Edmonds-Karp differs from Ford-Fulkerson in that it chooses the next augmenting path using BFS with the weight of 1 for every edge. So, if there are multiple augmenting paths to choose from, Edmonds-Karp will be sure to choose the shortest augmenting path from the source to the sink.

## 2. Network flow as a linear program.

Let $f_{uv}$ be the amount of flow set along the edge $(u, v)$ and $c_{uv}$ be the capacity of the edge $(u, v)$.  We want to maximize the flow into the sink subject to the following conditions:
1. **Capacity**: $f_{uv} \leq c_{uv}$.
2. **Conservation**: For every vertex $w$ besides $w = s$ and $w = t$, we must have that $\displaystyle \sum_{u,w} f_{uw} - \sum_{w,v} f_{wv} = 0.$
3. **Nonnegativity**: $f_{uv} \geq 0$.

[Table of Contents](./index.md)
<!--
![111596338](https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002)
-->

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
