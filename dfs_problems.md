# Problems on DFS


1. Find all SCC's in the following graph.

   <img width="334" alt="scc_problem1" src="https://github.com/user-attachments/assets/74590a7e-c9fa-4c3f-bfa1-a4affe8e11cf">

   We first find $G^R$ by reversing the direction of all the edges in $G$:

   <img width="710" alt="scc_problem1_b" src="https://github.com/user-attachments/assets/f41adc33-ca0b-416e-8399-e2e03632f0b9">

   Then we run DFS on $G^R$ and enumerate the vertices in **decreasing postorder** number:
   
<img width="360" alt="scc_problem1_c" src="https://github.com/user-attachments/assets/1ffaf47b-1762-41dc-955c-8256f5743d38">

The postorder numbers of DFS on $G^R$ are shown in red. Therefore, the vertices in decreasing postorder number are:

$$
B, G, C, A, D, H, E, F.
$$
   

3. asdfasasd
4. asdfdfass
5. 


[here](./README.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
