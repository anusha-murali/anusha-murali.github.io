# Problems on DFS


1. Find all SCC's in the following graph.

   <img width="300" alt="scc_problem1" src="https://github.com/user-attachments/assets/74590a7e-c9fa-4c3f-bfa1-a4affe8e11cf">

   We first find $G^R$ by reversing the direction of all the edges in $G$:

   <img width="710" alt="scc_problem1_b" src="https://github.com/user-attachments/assets/f41adc33-ca0b-416e-8399-e2e03632f0b9">

   Then we run DFS on $G^R$ and enumerate the vertices in **decreasing postorder** number:
   
   <img width="360" alt="scc_problem1_c" src="https://github.com/user-attachments/assets/1ffaf47b-1762-41dc-955c-8256f5743d38">

The postorder numbers of DFS on $G^R$ are shown in red. Therefore, the vertices in decreasing postorder number are:

$$
B, G, C, A, D, H, E, F.
$$
   
Now, run DFS on the original graph $G$ in the order of the above decreasing postorder numbers. We first start from vertex $B$ and get stuck after traversing $B, G,$ and $C$. So, $DFS(B) = \{B, G, C\}$.

Now we start DFS on $A$ and find $DFS(A) = \{A\}$.

Then we start DFS on $D$ and find $DFS(D) = \{D, H, E\}$.

Finally, we start DFS on $F$ and find $DFS(F) = \{F\}$.

Therefore, there are 4 SCCs in the given graph $G$, namely $(B, G, C), (A), (D, H, E),$ and $(F)$.

<img width="370" alt="scc_problem1_d" src="https://github.com/user-attachments/assets/b08196b8-fbbf-4706-9b40-38d5863112b0">


3. Problem 2



[Back to DFS](./dfs.md)

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)

