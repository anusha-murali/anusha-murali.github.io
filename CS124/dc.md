# Divide and Conquer

The **divide and conquer** paradigm (used for merge sort) uses the following steps:
  - **Divide** the problem into a number of subproblems that are smaller instances of the same problem.
  - **Conquer** the subproblems by solving them recursively.
    - ***Base case***: If the sub-problems are small enough, just solve them by brute force.
  - **Combine** the subproblem solutions to give a solution to the original problem.

## Seaching for maximum and minimum in a list

The naive approach to finding the maximum and minimum in a list requires at most $n-1$ comparisons to compute each of the maximum and the minimum element. Using the divide and conquer (or divide and combine) approach, we can achieve this using $3n/2 - 2) comparisons.

For simplicity, let's assume that the list size is a power to two. We use the following three steps:
- *Divide* the list into two equal sized sublists
- Recursively *solve* for the maximum and minimum for each sublist
- *Combine* these two subproblem solutions by comparing the two minimums and comparing the two maximums.

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
