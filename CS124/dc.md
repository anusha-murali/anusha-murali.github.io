# Divide and Conquer

The **divide and conquer** paradigm (used for merge sort) uses the following steps:
  - **Divide** the problem into a number of subproblems that are smaller instances of the same problem.
  - **Conquer** the subproblems by solving them recursively.
    - ***Base case***: If the sub-problems are small enough, just solve them by brute force.
  - **Combine** the subproblem solutions to give a solution to the original problem.

## 1. Seaching for maximum and minimum in a list

The naive approach to finding the maximum and minimum in a list requires at most $n-1$ comparisons to compute each of the maximum and the minimum element. Using the divide and conquer (or divide and combine) approach, we can achieve this using $3n/2 - 2) comparisons.

For simplicity, let's assume that the list size is a power to two. We use the following three steps:
- *Divide* the list into two equal sized sublists
- Recursively *solve* for the maximum and minimum for each sublist
- *Combine* these two subproblem solutions by comparing the two minimums and comparing the two maximums.

**Runtime** Let $T(n)$ denote the number of comparisons needed for the list size is $n$. The base case is $T(2) = 1$. Therefore, we have the following recursion:

$$
T(n) = 2T(n/2) + 2,
$$

where the 2 comes from the two comparisons for the maximum and minimum in the *combine* step. Using induction, we find $T(n) = 3n/2 -2$, which provides a 25% speed up over the naive approach.

## 2. Integer Multiplication

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

The above recurrence has the solution $T(n) = \Theta(n^2)$, which is the same as the "grade-school" multiplication algorithm.

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
