# Heaps and Priority Queues

## Heaps

Heaps (We focus on Min-Heaps in this discussion for concreteness) are binary trees for which every parent node has a value less than or equal to any of its children. We refer to this condition as the **heap invariant**.

A heap is a complete binary tree except that the last level may bee missing nodes, and if so is filled from left to right.

This implementation uses arrays for which heap[$k$] <= heap[$2k+1$] and heap[$k$] $\leq$ heap[$2k+2$] for 
all $k$, counting elements from zero. Non-existing elements are considered to be infinite. 
The interesting property of a heap is that its smallest element is always the root, heap[$0$].

<img width="1418" alt="heap" src="https://github.com/user-attachments/assets/7a283232-bdb1-47d5-a49e-815af2ce0946" />



## Priority Queues

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
