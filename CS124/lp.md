# Linear Programming


Many of the problems for which we want algorithms are optimization tasks: the shortest path, the cheapest spanning tree, the longest increasing subsequence, and so on. In such cases, we seek a solution that,
  1. satisfies certain constraints (for instance, the path must use edges of the graph and lead from $s$ to $t$, the tree must touch all nodes, the subsequence must be increasing); and,
  2. is the best possible, with respect to some well-defined criterion, among all solutions that satisfy these constraints.


Linear programs, in general, have the following form: there is a objective function that one seeks to maximize or minimize, along with constraints on the variables. The objective function and the constraints are all linear in the variables; that is, all equations have no higher powers of the variables, nor are the variables multiplied together.

## 1. Two Player Games

Consider a **mixed strategey** game between two players, $X$ and $Y$, where each player can choose between 3 actions, namely $A, B,$ and $C$. Following is the game matrix with $X$ as the row player and $Y$ as the column player.

$$
\begin{bmatrix}
 & A & B & C \\
A& 3 & 1 & -1 \\
B& -2 & 3 & 2 \\
C&1 & -2 & 4 
\end{bmatrix}
$$

Let $X$ play actions $A, B,$ and $C$ with probabilities $x_1, x_2$ and $x_3$ respectively. Player $X$ wants to choose these probabilities in such a way that no mater what her opponent ($Y$) chooses, $X$ can be guaranteed to get a payoff of at least $x_4$. Hence, we have the following LP that **maximizes** the payoff for the row player $X$:
- $\max x_4$
- $x_1, x_2, x3 \geq 0$
- $x_1 + x_2 + x_3 = 1$
- $3x_1 - 2x_2 + x_3 \geq x_4$
- $x_1 + 3x_2 - 2x_3 \geq x_4$
- $-x_1 + 2x_2 + 4x_3 \geq x_4$

Now, we can write the dual LP, which is the column player, $B$'s **minimization** problem:
- $\min y_4$
- $y_1,y_2,y_3 \geq 0$
- $y_1 + y_2 + y_3 =1$
- $3y_1 + y_2 -y_3 \leq y_4$
- $-2y_1 + 3y_2 + 2y_3 \leq y_4$
- $y_1 -2y_2 + 4y_3 \leq y_4$

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)


