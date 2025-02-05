# Network Flow

Model a connection of water pipes (a network of roads) as edges with capacity on a directed graph. We want to solve the problem of finding how many units of water (or trucks) can we send from the source to the sink?

## 1. The Ford-Fulkerson Method

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

We look for augmenting path again and find that the path $S\rightarrow A\rightarrow C\rightarrow D\rightarrow T$ with the residual capacities 6, 2, 9, and 10. Their minimum is 2, so we can increase the flow along this path by 2. This gives a total flow to $T$ of 4 + 2 = 6.

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

###  Choosing good augmenting paths

The following flow example shows the importance of choosing good augmenting paths.

<img width="450" alt="8" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/2c815eb0-2e3b-4619-a047-ccee0cf9ede3">

Let the first augmenting path be $S\rightarrow A \rightarrow B \rightarrow T$, giving a flow of 1.

<img width="450" alt="9" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/cb81e4e1-d6ad-4e23-b7f2-b9bff20a4ccb">

Let the second augmenting path be $S\rightarrow B \rightarrow A \rightarrow T$, which increments the total flow to 2. We are able to send 1 unit in the reversed direction of $B \rightarrow A$, because the forward direction $A \rightarrow B$ is at its maximum capacity (or its residual capacity is 0).

<img width="450" alt="10" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/a645699d-0dc4-404a-9aa8-b02f71f5b4c2">

Now, let the third augmenting path be $S\rightarrow A \rightarrow B \rightarrow T$, again reversing the flow. This increments the total flow to 3.

<img width="450" alt="11" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/364d60cc-3d9f-4264-af33-ea575a2dccb2">

We can continue in this manner, each time reversing the flow between $A \rightarrow B$ and $B \rightarrow A$, for a total of 200 iterations before reaching the max flow of 200.

On the other hand, let the first augmenting path be $S \rightarrow A \rightarrow T$. This gives us a flow of 100.

<img width="450" alt="12" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/107518e6-a1e0-405e-958e-015f62540def">

Now, let the second augmenting path be $S \rightarrow B \rightarrow T$, which gives us a total flow of 200. There are no more augmenting paths and our max-flow for the network is 200, which we obtained in just 2 iterations.

<img width="450" alt="13" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/ccea07f9-7a2a-4781-857e-7fe8a9900a26">

Therefore, we notice that some choices lead to **exponential** algorithms, while clever choices lead to **polynomial** algorithms.

In order to choose augmenting paths with few iterations, we need to select the ones with fewest number of arcs (i.e: shortest path) and with maximum bottleneck capacity (i.e: fattest path). One such algorithm is the **Edmonds-Karp** algorithm, which uses BFS.

### Run-time

1. Ford-Fulkerson has a run-time of $O(Ef^{\*})$ because each time we augment a path, we increase the total flow, so at worst the number of times we find an augmenting path is $O(f^*)$, where $f^{\*}$ is the value of the max flow. We can find an augmenting path in $O(E)$ with DFS.
2. **Edmonds-Karp algorithm**: If we use BFS instead of find our augmenting paths, then can be proved that the run-time is $(O(V E^2)$, which does not depend on $f^{\*}$ anymore.

Edmonds-Karp differs from Ford-Fulkerson in that it chooses the next augmenting path using BFS with the weight of 1 for every edge. So, if there are multiple augmenting paths to choose from, Edmonds-Karp will be sure to choose the shortest augmenting path from the source to the sink.

## 2. Max-flow Min-cut Theorem

**Theorem**: For every directed graph $G$, the maximum flow on $G$
with capacities $c$ equals the minimum cut in $G$ with capacities $c$.

A  $s$-$t$-cut is a partition of the vertices of a flow network into two sets, such that a set includes the source  $s$  and the other one includes the sink  $t$. The capacity of an  $s$-$t$-cut is defined as the sum of capacities of the edges from the source side to the sink side.

Obviously, we cannot send more flow from  $s$  to  $t$  than the capacity of any  $s$-$t$-cut. Therefore, the maximum flow is bounded by the minimum cut capacity.

The max-flow min-cut theorem goes even further. It says that the capacity of the maximum flow has to be equal to the capacity of the minimum cut.


**Example 2**: Find the max-flow in the graph of Example 1 using the min-cut property.

<img width="410" alt="7" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/6de40a34-4d86-48d2-8702-effb7e5a4b39">

The red dotted-line shows the min-cut of all the possible cuts. The flow coming out of $S$ is 10 + 9 = 19, which is the max-flow of this network. 

Note that we don't consider the flow on edge $A\rightarrow C$, as it is going into the source node, $S$.

**Example 3**: Find the max-flow in the graph below using the min-cut property.

![Cut](https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/fb2d4dc9-9e8d-44ed-a3b5-c36345871528)

The minimum cut of the given flow network is shown above. We see that the capacity of the cut  $\\{s, A, D\\}$  and  $\\{B, C, t\\}$  is  $5 + 3 + 2 = 10$ , which is equal to the maximum flow. Other cuts will have a bigger capacity, like the capacity between  $\\{s, A\\}$  and  $\\{B, C, D, t\\}$  is  $4 + 3 + 5 = 12$.

**Example 4**: True or False? If an iteration of the Ford-Fulkerson algorithm on a network places flow 1 through an edge $(u,v)$, then in every later iteration, the flow through $(u,v)$ is at least 1.

**False**. A later augmenting path may pass through $(v, u)$, causing the flow on $(u, v)$ to be decreased.

**Example 5** Let $G$ be an input graph to the max flow problem. Let $C$ be a minimum $S$-$T$ cut in the graph. Suppose we add 1 to the capacity of every edge in the graph. Is it necessarily true that $C$ is still a minimum cut? If so, prove it, if not give a counterexample.

**False**. Let $G = (V, E)$, where $V = \{S, A, B, T\}$ and $E = \{(S, A),(A,T), (B, T)\}$ with initial capacities 2.5, 1, and 1 respectively. So the min-cut is $\{(A,T), (B,T)\}$ with the max-flow of 2. 

However, if you increase the capacity of each edge by 1, then the min-cut will be $\{S, A\}$ with the max-flow of 3.5.


## 3. Network flow as a linear program

Let $f_{uv}$ be the amount of flow sent along the edge $(u, v)$ and $c_{uv}$ be the capacity of the edge $(u, v)$.  We want to maximize the flow into the sink subject to the following conditions:
1. **Capacity**: $f_{uv} \leq c_{uv}$.
2. **Conservation**: For every vertex $w$ besides $w = s$ and $w = t$, we must have that $\displaystyle \sum_{u,w} f_{uw} - \sum_{w,v} f_{wv} = 0.$
3. **Nonnegativity**: $f_{uv} \geq 0$.

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)

