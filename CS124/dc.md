# Divide and Conquer

The **divide and conquer** paradigm (used for merge sort) uses the following steps:
  - **Divide** the problem into a number of subproblems that are smaller instances of the same problem.
  - **Conquer** the subproblems by solving them recursively.
    - ***Base case***: If the sub-problems are small enough, just solve them by brute force.
  - **Combine** the subproblem solutions to give a solution to the original problem.

## 1. Seaching for maximum and minimum in a list

The naive approach to finding the maximum and minimum in a list requires at most $n-1$ comparisons to compute each of the maximum and the minimum element. Using the divide and conquer (or divide and combine) approach, we can achieve this using $3n/2 - 2$ comparisons.

For simplicity, let's assume that the list size is a power to two. We use the following three steps:
- *Divide* the list into two equal sized sublists
- Recursively *solve* for the maximum and minimum for each sublist
- *Combine* these two subproblem solutions by comparing the two minimums and comparing the two maximums.

**Runtime** Let $T(n)$ denote the number of comparisons needed for the list size is $n$. The base case is $T(2) = 1$. Therefore, we have the following recursion:

$$
T(n) = 2T(n/2) + 2,
$$

where the 2 comes from the two comparisons for the maximum and minimum in the *combine* step. Using induction, we find $T(n) = 3n/2 -2$, which provides a 25% speed up over the naive approach.

## 2. Integer Multiplication: Karatsuba's Algorithm

The "grade-school" algorithm for multiplying two $n$-digit numbers $x,y$ takes $\Theta(n^2)$ time. Let us try a divide and conquer approach as follows.

Let us represent $x$ and $y$ as, $x = 10^{n/2}a + b, y = 10^{n/2}c + d$, where $a, b, c, d$ are $n/2$ digit numbers. Then,

$$
xy = 10^n ac + 10^{n/2} (ad + bc) + bd.
$$

Letting $T(n)$ be the time to multiply two $n$-digit numbers, we obtain the recursion,

$$
T(n) = 4T(n/2) + O(n),
$$
where $4T(n/2)$ comes from solving the four smaller subproblems on $n/2$-digit numbers, and the $O(n)$ term comes from the time to combine these problems into the final solution. 

Unfortunately, the above recurrence has the solution $T(n) = \Theta(n^2)$, which is the same as the "grade-school" multiplication algorithm.

The ***key trick*** is to notice is that four multiplications is too many and we would already get a polynomial improvement in the asymptotic runtime if we could reduce it to three.

The trick is that we do not need to compute ad and bc separately; we only need their sum ad + bc. Now note that,

$$
(a + b)(c + d) = (ad + bc) + (ac + bd). 
$$

So if we calculate $ac, bd,$ and $(a + b)(c + d)$, we can compute $ad + bc$ by the subtracting the first two terms from the third! Of course, we have to do a bit more addition, but since the bottleneck to speeding up this multiplication algorithm is the number of smaller multiplications required, that does not matter. The recurrence for $T(n)$ is now,

$$
T(n) = 3T(n/2) + O(n),
$$

which has the solution $T(n) = n^{\log_2 3} \approx n^{1.59}$, which is an improvement over the $O(n^2)$ algorithm.

## 3. Matrix Multiplication: Strassen's Algorithm

In this section, we will consider an approach to speed up matrix multiplication. Let us consider an $n \times n$ matrix $A$. Let $A_{ij}$ denote the entry of $A$ in the $i$-th row and $j$-th column, where $1 \leq i, j \leq n$.  

Given two $n \times n$ matrices $X, Y$, the product $Z= XY$ is the $n \times n$ matrix such that for any indices $1 \leq i, j \leq n$,

$$
Z_{ij} = (XY)_{ij} = \sum_{k=1}^n X_{ik} Y{kj}.
$$

We note that computation  of $Z_{ij}$ takes $O(n)$ time, and there are $n^2$ such computations required. Therefore, the traditional "grade-school" matrix multipilcation of $Z = XY$ takes $O(n^3)$ time.

We will now attempt to improve upon this using divide and conquer as follows. For simplicity, we assume that $n$ is a power of two. We can break each $n \times n$ matrix into four submatrices, each of size $n/2 \times n/2$. Multiplying the original matrices can be broken down into eight matrix multiplications with some matrix additions:

$$
\begin{bmatrix}
A & B \\
C & D 
\end{bmatrix}
\begin{bmatrix}
E & F \\
G & H 
\end{bmatrix} 
= \begin{bmatrix}
AE + BG & AF + BH\\
CE + DG & CF + DH
\end{bmatrix}
.
$$

Hence, the time to multiply two $n \times n$ matrices using the above approach is,

$$
T(n) = 8T(n/2) + \Theta(n^2),
$$

where the factor 8 comes from the eight matrix multiplications, and the $\Theta(n^2)$ comes from the work required to sum together four pairs of matrices, since adding together two matrices takes $O(n^2)$ time. From the Master Theorem, we see the runtime of this algorithm is $O(n^3)$. Hence, we see that this divide and conquer approach does not yet improve upon the naive "grade-school" algorithm. 

The ***key trick*** is to bring the number of subproblems we generate down from 8. The Strassen's algorithm achieves this by first computing the following seven products:

$$
\begin{matrix}
P_1 = A(F-H) & ~~~& ~~~& P_5 = (A+D)(E+H) \\
P_2 = (A+B)H &~~~ & ~~~& P_6 = (B-D)(G+H) \\
P_3 = (C+D)E &~~~ & ~~~& P_7 = (C-A)(E+F) \\
P_4 = D(G-E) & ~~~& ~~~&
\end{matrix}
$$

Now, we can find the four entries of the product matrix as follows:

$$
\begin{align*}
AE + BG &= -P_2 + P_4 + P_5 + P_6\\
AF + BH\ &= P_1 + P_2 \\
CE + DG &= P_3 + P_4 \\
CF + DH &= P_1 - P_3 + P_5 + P_7
\end{align*}
$$

Since there are only seven multiplications in computing $P_1, P_2, \ldots, P_7$, our recurrence becomes,

$$
T(n) = 7T(n/2) + \Theta(n^2),
$$

which yields a runtime of $T(n) = \Theta(n^{\log_2 7}) \approx \Theta(n^{2.81})$.


[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
