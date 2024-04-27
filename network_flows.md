# Network Flow

Model a connection of water pipes (a network of roads) as edges with capacity on a directed graph. We want to solve the problem of finding how many units of water (or trucks) can we send from the source to the sink?

## 1. The Ford-Fulkerson Method

**Max-flow Min-cut Theorem**: For every directed graph $G$, the maximum flow on $G$
with capacities $c$ equals the minimum cut in $G$ with capacities $c$.

**Residual Capacity**: A residual capacity of a directed edge is the capacity minus the flow. 

The Ford-Fulkerson method works as follows. First, we set the flow of each edge to zero. Then we look for an augmenting path from  $S$  to  $T$ . An augmenting path is a simple path in the residual graph, i.e. along the edges whose residual capacity is positive. If such a path is found, then we can increase the flow along these edges. We keep on searching for augmenting paths and increasing the flow. Once an augmenting path doesn't exist anymore, the flow is maximal.

If $f$ is a flow in a flow network $G = (V, E)$ with source $S$ and sink $T$,then the following conditions are equivalent:
1. $f$ is a maximum flow in $G$
2. The residual network $G_f$ contains no augmenting paths.
3. $\|f\| = c(S, T)$ for some cut $(S, T)$ of $G$.

Only the following edges can be used for augmentation:
1. Non-null forward edges
2. Non-empty backward edges

**Example 1**: Find the max-flow in the following graph.

<img width="400" alt="1" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/db030dff-f39f-4139-9fc8-a7a76efd4118">

We run the Ford-Fulkerson method on the above graph as follows:

We find the path $S \rightarrow A\rightarrow B\rightarrow T$ with the residual capacities of 10, 4, 10. Their minimum is 4, so we can increase the flow along this path by 4. This gives a flows of 4 for the network.

<img width="400" alt="2" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/84959a8e-6f97-4dc3-b03f-3ad7af97d354">

We look for augmenting path again and find that the path $S\rightarrow A\rightarrow C\rightarrow D\rightarrow T$ with the residual capacities 6, 2, 7, and 8. Their minimum is 2, so we can increase the flow along this path by 2. This gives a total flow to $T$ of 4 + 2 = 6.

<img width="400" alt="3" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/28031b00-f3fc-4eaf-95fe-055850233b4c">

This time we find the path $S\rightarrow C\rightarrow D\rightarrow T$ with the residual capacities of 10, 7, and 8. Their minimum is 7, so we can increase the flow along this path by 7. This gives a total flow to $T$ of 4 + 2 + 7 = 13.

<img width="400" alt="4" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/16594731-5f49-479c-b9a8-cac872b79cc6">

We look for an augmenting path again and find that $S\rightarrow A\rightarrow D\rightarrow B\rightarrow T$ with the residual capacities 4, 8, 6, and 6. Their minimum is 4, so we can increase the flow along this path by 4. This gives a total flow to $T$ of 4 + 2 + 7 + 4 = 17.

<img width="400" alt="5" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/eb964b05-1a42-40b6-8d9e-f577dfd6c1e7">

We again carefully check for more augmenting paths. We recall that an augmenting path is either a **non-null forward edge** or a **non-empty backward edge**. We find the path $S\rightarrow C\rightarrow A\rightarrow D\rightarrow B\rightarrow T$ with the residual capacities 3, 2, 4, 2, 2. Their minimum is 2, so we can increase the flow along this path by 2. Note that this path is very interesting. It includes the **reversed edge** $(C, A)$. In the original network, we are not allowed to send any flow from $C$ to $A$. But because we already have a flow of 2 from $A$ to $C$, this is possible. 

The intuition of this is the following: Instead of sending a flow of 2 from $A$ to $C$, we reduce it to 0, and compensate this by sending an additional flow of 2 from $S$ to $C$, which allows us to send an additional flow of 2 along the path $A\rightarrow D\rightarrow T$.

<img width="400" alt="6" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/b35adaa8-69cd-49d9-8aca-f49689081038">

So, the total flow to $T$ is 4 + 2 + 7 + 4 + 2 = 19.

Now, it is impossible to find any more augmenting path between $S$ and $T$, therefore 19 is the maximal possible flow.

**Example 2**: Find the max-flow in the graph of Example 1 using the min-cut property.

<img width="410" alt="7" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/2b9fbf96-1382-464d-bbcb-b5471a8bc7df">

The red dotted-line shows the min-cut of all the possible cuts. The flow coming out of $S$ is 10 + 9 = 19, which is the max-flow of this network. 

Note that we don't consider the flow on edge $A\rightarrow C$, as it is going into the source node, $S$.

**Example 3**: Find the max-flow in the graph below using the min-cut property.

![Cut](https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/fb2d4dc9-9e8d-44ed-a3b5-c36345871528)

The minimum cut of the given flow network is shown above. We see that the capacity of the cut  $\\{s, A, D\\}$  and  $\\{B, C, t\\}$  is  $5 + 3 + 2 = 10$ , which is equal to the maximum flow. Other cuts will have a bigger capacity, like the capacity between  $\\{s, A\\}$  and  $\\{B, C, D, t\\}$  is  $4 + 3 + 5 = 12$.



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
