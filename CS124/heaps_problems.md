
<img width="1375" alt="favorite_heaps" src="https://github.com/user-attachments/assets/ed134049-eb42-4302-a7a6-71d735ca402c" />


1. What are the minimum and maximum numbers of elements in a heap of height $h$?
   The maximum number of elements is when the bottom row is full, which is,

   $$
1 + 2 + 2^2 + 2^h = 2^{h+1} -1.
   $$

   And the minimum number occurs when the bottom row has only 1 element, and is $2^h - 1 + 1 = 2^h$.

   
2. Show that an $n$-element heap has height $\lfloor \log n \rfloor$.

   From the previous problem, we find $2^h \leq n \leq 2^{h+1} - 1 < 2^{h+1}$. Hence $h \leq \log n < h + 1$. Since $h$ is an integer, we find $h = \lfloor \log n \rfloor$.
3. Show that in any subtree of a max-heap, the root of the subtree contains the largest value occurring anywhere in that subtree.
   
   We prove this using contradiction. Assume the above claim is false - so there is a subtree whose root is not the largest element in the subtree, which implies that the maximum element is somewhere else in the subtree. Let $k$ be the index where the maximum appears. Since we assumed the maximum is not at the root of the subtree, then node $k$ has a parent. Therefore the parent's index is smaller than $k$, or $A[parent(k)] < A[k]$, which violates the max-heap property that any parent node must be larger than or equal to the node. Hence our assumption is false and therefore the claim is true.
5. Where in a max-heap might the smallest element reside, assuming that all elements are distinct?
   
   The smallest element must reside in a leaf.
7. Is an array that is in sorted order a min-heap?
   
   Yes. This is because $A[i] \leq A[2i+1]$, where $2i \leq n$, and $A[i] \leq A[2i+2]$, where $2i+2 \leq n$. (Note that we are using 0-indexing here).

9. Is the array with values (23, 17, 14, 6, 13, 10, 1, 5, 7, 12) a max-heap?
    
    No. For a max-heap, the parent at index $k$, $A[k]$ must be $\geq$ to both its children, $A[2k+1]$ and $A[2k+2]$. However, the element $A[3] = 6,$ which is the parent of $A[8]$, is smaller than $A[8] = 7$. Please note that I am using 0-based indexing to be consistent with Python.
   
11. Show that, with the array representation for storing an $n$-element heap, the leaves are the nodes indexed by $\lfloor n/2 \rfloor +1, \lfloor n/2 \rfloor +2, \ldots, n$.
   
    For a heap (both min-heap and max-heap), using 1-based indexing, the children of a node at index $k$ are at $2k$ and $2k+1$. Hence for the node at index $\lfloor n/2 \rfloor +1$, its left child will be at $2(\lfloor n/2 \rfloor +1) > n$, which is not possible as there are only $n$ elements in the heap. So, the node at index $\lfloor n/2 \rfloor +1$ must be a leaf. Using the same arguments we see that all the nodes indexed by $\lfloor n/2 \rfloor +1, \lfloor n/2 \rfloor +2, \ldots, n$ must be leaves.

    We also need to show that the previous node indexed by $k = \lfloor n/2 \rfloor$ is not a leaf. Its left child is indexed by $2k = 2  \lfloor n/2 \rfloor \leq n$. Therefore, the node indexed by $k = \lfloor n/2 \rfloor$ is not a leaf.
    
13. What is the effect of calling MAX-HEAPIFY$(A, i)$ when the element $A[i]$ is larger than its children?

    There will be no changes to the max-heap as the heap-invariant property is not violated at this node.
    
15. What is the effect of calling MAX-HEAPIFY$(A, i)$ for $i > A.\text{heap-size}/2$?

    The heap doesn't change as $A[i]$, when $i > A.\text{heap-size}/2$, is a leaf.
    
17. Show that the worst-case running time of MAX-HEAPIFY on a heap of size $n$ is $\Omega(\log n)$. (*Hint*: For a heap with $n$ nodes, give node values that cause MAX_HEAPIFY to be called recursively at every node on a simple path from the root down to a leaf.)
    
    If the root $A[0]$ of the max-heap contains a value that is smaller than all the values in the left and subtrees, then MAX-HEAPIFY() will be forced to recursively call itself until the smallest value is placed at a leaf. The height of the heap is $h = \log n$. So, placing the smallest value in the root will force MAX_HEAPIFY() to be called $h$ times. Given that each call of MAX_HEAPIFY() does $\Theta(1)$ work, the total cost of max-heapifying this heap is $\Theta(h) = \Theta(\log n)$, which implies its worst-case running time is $\Omega(\log n)$.
    
19. Why do we want the loop index $i$ of `Build-MaxHeap()` (or `Build-MinHeap()`) to decrease from $\lfloor A.\text{length}/2\rfloor$ to 1 rather than increase from 1 to $\lfloor A.\text{length}/2\rfloor$?

    `Build-MaxHeap()` (or `Build-MinHeap()`) assumes that both subtrees of the current node $i$ have the max-heap (or min-heap) property. Leaves, by default, satisfy the max-heap (or min-heap) property. Therefore, we want to proceed from the leaves to the root.
    
21. Show that there are at most $\lceil n/2^{h+1} \rceil$ nodes of height $h$ in any $n$-element heap.

    From an earlier problem, we know that $n$-element heap has $\lceil n/2 \rceil$ leaves. Let us prove this using contradiction. Assume that an $n$-element heap has at least $\lceil n/2^{h+1} \rceil + 1$ nodes of height $h$. We see that exactly one node of height $h$ is on the unique simple path from the last leaf to the root, and the subtree rooted at this node has at least one leaf (which is the last leaf). Every other node of height $h$, of which the heap contains at least $\lceil n/2^{h+1} \rceil$, are the roots of complete binary subtrees, and each such node is the root of a subtree with $2^h$ leaves. Since each subtree whose root is at height $h$ is disjoint, the number of leaves in the entire heap is at least,
    
    $$
   \left \lceil \frac{n}{2^{h+1}} \right \rceil \cdot 2^h + 1 \geq \left \lceil \frac{n}{2^{h+1}}  \cdot 2^h \right \rceil + 1 = \left \lceil \frac{n}{2} \right \rceil + 1,
    $$
    
    which contradicts the property that an $n$-element heap has $\lceil n/2 \rceil$ leaves.
    
23. 
24. 


[Back to Heaps and Priority Queues](./heaps.md)

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
