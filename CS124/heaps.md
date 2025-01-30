# Heaps and Priority Queues

## Heaps

Heaps (We focus on Min-Heaps in this discussion for concreteness) are binary trees for which every parent node has a value less than or equal to any of its children. We refer to this condition as the **heap invariant**.

A heap is a complete binary tree except that the last level may bee missing nodes, and if so is filled from left to right.

This implementation uses arrays for which heap[$k$] <= heap[$2k+1$] and heap[$k$] $\leq$ heap[$2k+2$] for 
all $k$, counting elements from zero. Non-existing elements are considered to be infinite. 
The interesting property of a heap is that its smallest element is always the root, heap[$0$].

<img width="1418" alt="heap" src="https://github.com/user-attachments/assets/7a283232-bdb1-47d5-a49e-815af2ce0946" />

The min-heap shown above is represented in the form of a binary tree. It's array representation is shown below. 

<p align="center">
<img width="400" alt="heap_array" src="https://github.com/user-attachments/assets/d98de70b-5a52-4178-98d1-a87652f03d2b" />
</p>

The number within the circle at each node in the tree is the value stored at that node. The number above a node is the corresponding index in the array. Above and below the array are lines showing parent-child relationships; parents are always to the left of their children. The tree has height three; the node at index 4 (with value 9) has height two.

### Extracting the Minimum Element

In a min-heap, the root is the minimum element. Therefore, the minimum element can be extracted in constant time, however the resulting tree will need to be reorganized to maintain the **heap invariant**, which requires $O(\log n)$ time.

Following is a concrete example.

Consider the deleting the minimum element from the following min-heap.

<img width="1375" alt="min-heap1" src="https://github.com/user-attachments/assets/7fc709e6-2c5e-41b3-bb18-cf08f4aab4a1" />

Since the minimum value is found at the root of a min-heap, the minium is $A[0]$.  Therefore, we asssign $A[0]$ to `min`.

<img width="1375" alt="min-heap2" src="https://github.com/user-attachments/assets/ec27d465-f977-4d00-91ee-c7fce871a3fa" />

We then move the very last element ($A[6]$ in the tree) to the root of the min-heap as shown below, and reduce the heap-size by 1.

<img width="1375" alt="min-heap3" src="https://github.com/user-attachments/assets/f75fc281-803d-48db-96f6-b6ccff58ead2" />

Next, we call {\sc Min-Heapify()} on $A$ passing the index of the sub-tree to be min-heapified. In this case, we want to min-heapify from the root. Therefore, we call {\sc Min-Heapify($A, 0$)}.

Min-heapify restores the min-heap property.

<img width="1375" alt="min-heap4" src="https://github.com/user-attachments/assets/67011b11-3843-4ce1-b886-050210b18642" />

### `Min-Heapify()` Restores the Min-Heap Property

In a min-heap, every element is less than or equal to its children.  During an insert or delete operation in a min-heap, if the min-heap property is violated - that is given an array $A$ and an index $i$ such that the subtrees rooted at `left[i]` and `right[i]` are min-heaps, but $A[i]$ is greater than its children - we can use `Min-Heapify` to restore the min-heap property for the tree rooted at node $A[i]$.



## Priority Queues

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
