# Heaps and Priority Queues

## Heaps

Heaps (or Min-Heaps) are binary trees for which every parent node has a value less than or equal to any 
of its children. We refer to this condition as the **heap invariant**.

This implementation uses arrays for which heap[$k$] <= heap[$2k+1$] and heap[$k$] $\leq$ heap[$2k+2$] for 
all $k$, counting elements from zero. Non-existing elements are considered to be infinite. 
The interesting property of a heap is that its smallest element is always the root, heap[$0$].


## Priority Queues

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
