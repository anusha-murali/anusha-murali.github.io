
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

### 1. Extracting the Minimum Element (Extract-MinHeap())

In a min-heap, the root is the minimum element. Therefore, the minimum element can be extracted in constant time, however the resulting tree will need to be reorganized to maintain the **heap invariant**, which requires $O(\log n)$ time.

Following is a concrete example.

Consider the deleting the minimum element from the following min-heap.

<img width="1375" alt="min-heap1" src="https://github.com/user-attachments/assets/7fc709e6-2c5e-41b3-bb18-cf08f4aab4a1" />

Since the minimum value is found at the root of a min-heap, the minium is $A[0]$.  Therefore, we asssign $A[0]$ to `min`.

<img width="1375" alt="min-heap2" src="https://github.com/user-attachments/assets/ec27d465-f977-4d00-91ee-c7fce871a3fa" />

We then move the very last element ($A[6]$ in the tree) to the root of the min-heap as shown below, and reduce the heap-size by 1.

<img width="1375" alt="min-heap3" src="https://github.com/user-attachments/assets/f75fc281-803d-48db-96f6-b6ccff58ead2" />

Next, we call `Min-Heapify()` on $A$ passing the index of the sub-tree to be min-heapified. In this case, we want to min-heapify from the root. Therefore, we call `Min-Heapify`($A, 0$).

Min-heapify restores the min-heap property.

<img width="1375" alt="min-heap4" src="https://github.com/user-attachments/assets/67011b11-3843-4ce1-b886-050210b18642" />

**Runtime** 

`Extract-MinHeap()` returns the minimum element (root of the min-heap) in constant time. However, it calls `Min-Heapify()` to restore the min-heap property, which has a runtime of $O(\log n)$ (Please see below). Therefore, the runtime of `Extract-MinHeap()` is $O(\log n)$.


###  2. Restoring the Min-Heap Property (Min-Heapify())

In a min-heap, every element is less than or equal to its children.  During an insert or delete operation in a min-heap, if the min-heap property is violated - that is given an array $A$ and an index $i$ such that the subtrees rooted at `left[i]` and `right[i]` are min-heaps, but $A[i]$ is greater than its children - we can use `Min-Heapify` to restore the min-heap property for the tree rooted at node $A[i]$.

Following is a concrete example. Let us say that the element with value 10 is currently at the root (probably deletion of the previous root). We run the `Min-Heapify()` algorithm on this node as follows.

Step 1. Since 10 is larger than its left and right children, it violates the min-heap property. So, we compare its left and right children and find the index of the smallest of the three.

<img width="1375" alt="min-heapify1" src="https://github.com/user-attachments/assets/dcf84690-8d88-40bc-93fc-127cad2020ab" />

Step 2: Since $A[2] = 2$ is the smallest, we select it for exchange with its parent, $A[0] = 10$.

<img width="1375" alt="min-heapify2" src="https://github.com/user-attachments/assets/7858545d-eee0-49e2-9594-ecd936eac6f5" />

Step 3: Recursively call `Min-Heapify()` on $A[2]$ now.

<img width="1375" alt="min-heapify3" src="https://github.com/user-attachments/assets/a6b33a94-87b5-4a0f-a254-93808c1aca86" />

Step 4: Since $A[5] = 3 < A[2] = 10$, we exchange them and the tree's Min-Heap property has been completely restored now.

<img width="1375" alt="min-heapify4" src="https://github.com/user-attachments/assets/42a9dabb-a2cc-4d91-8870-b5e86bd690e2" />

**Runtime** 

The running time of `Min-Heapify()` on a subtree of size $n$ rooted at a given node $i$ is the $\Theta(1)$
time to fix up the relationships among the elements $A[i], A[\text{left}(i)]$ and $A[\text{right}(i)]$, plus the time to run `Min-Heapify` on a subtree rooted at one of the children of node $i$.

The children's subtrees each have size at most $2n/3$ - the worst case occurs when the bottom level of the tree is exactly half full. Hence we can use the following recurrence to describe the runtime of `Min-Heapify()`:

$$
T(n) \leq T(2n/3) + \Theta(1).
$$

From Case 2 of the [Master Theorem](./fundamentals.md), the solution to this recurrence is $T(n) = O(\log n)$.

Therefore, the runtime of `Min-Heapify()` is equal to the depth of the tree, which is $O(h) = O(\log n)$.

Since `Extract-MinHeap()` returns the minimum element (root of the min-heap) in constant time and calls `Min-Heapify()` to restore the min-heap property, the runtime of `Extract-MinHeap()` is also $O(\log n)$.

### 3. Inserting into Min-Heap (Insert-MinHeap())

Let us say that we are inserting a value 7 into the min-heap. It will be added to the right-most position of the last row as shown below. Then we will apply the `Insert-MinHeap()` algorithm shown on the right until the nodes have been reorganized to achieve the min-heap property.

Step 1: A new node with value 7 is added to the right-most position of the last row.

<img width="1375" alt="insert-heap1" src="https://github.com/user-attachments/assets/5c3f7bcf-6e38-47d1-9154-38187bd2668f" />

Step 2: Since $A[\text{parent}(6)] = 10 > A[6] = 7$, we exchange their positions.

<img width="1375" alt="insert-heap2" src="https://github.com/user-attachments/assets/7b8d1400-dc6b-4734-964f-c6646a769f42" />


Step 3: Since $A[\text{parent}(5)] = 7 > A[5] = 3$, we exchange their positions.

<img width="1375" alt="insert-heap3" src="https://github.com/user-attachments/assets/1ac7226b-9476-4e5d-969c-b024c132716e" />

**Runtime**

The runtime of `Insert-MinHeap()` used above is bounded by the height of the tree, so it is $O(\log n)$. 

### 4. Building a Min-Heap (Build-MinHeap())

Suppose we start with an empty heap and insert $n$ elements to build a min-heap of size $n$. By the above reasoning, the runtime to build a min-heap of size $n$ is *bounded* by $O(n \log n)$. 

The above upper bound, though correct, is not asymptotically tight. We can derive a tighter bound of $O(n)$ by observing that the time for `Min-Heapify()` to run at a node varies with the height of the node in the tree, and the heights of most nodes are small.

Our tighter analysis relies on the properties that an $n$-element heap has height $\lfloor \log n \rfloor$ and at most $\lceil n/2^{h+1} \rceil$ nodes of any height $h$.

Let us say that the input is the array $A$ of $n$ elements and the output is MinHeap of $A$. We note that the leaves of the min-heap are the nodes indexed by $\lfloor n/2 \rfloor, \lfloor n/2 \rfloor + 1, \ldots, n-1$. So, we start building our min-heap from the leaves, where each leaf is a 1-element heap. The procedure `Build-MinHeap()` goes through the remaining nodes of the tree and runs `Min-Heapify()` on each of them.

We use the following algorithm to build the min-heap. Note that we use 0-indexing (CLRS and most other texts use 1-indexing).

```
def Build-MinHeap(A):
   for (i = floor(length[A]/2) - 1 downto 0)
      Min-Heapify(A, i)
```

The time required by `Min-Heapify()` when called on a node of height $h$ is $O(h)$, and so we can express the total cost of `Build-MinHeap()` as being bounded from above by,

$$
\sum_{h=0}^{\lfloor \log n \rfloor} \lceil \frac{n}{2^{h+1}} \rceil O(h) = O \left ( n \sum_{h=0}^{\lfloor \log n \rfloor} \frac{h}{2^h} \right ).
$$

Let us consider the number of trees of a given height $h$ and add them all up as shown below:

$$
\begin{align*}
\text{Runtime} &= O \left ( n \sum_{h=0}^{\lfloor \log n \rfloor} \frac{h}{2^h} \right ) \\
&= O \left ( n \sum_{h=0}^{\infty} \frac{h}{2^h} \right ) \\
&= O(n).
\end{align*}
$$

Hence, we can build a min-heap from an unordered array in linear time.

## The Heapsort Algorithm

Assume that we have an unordered array $A$ of $n$ elements. The heapsort algorithm is as follows:

- Builds a Max-Heap from $A$
- Starting with the root (the maximum element), the algorithm places the maximum element into the correct place in $A$ by swapping it with the element in the last position of $A$.
- "Discard" this last node (knowing that it is in its correct place) by decreasing the heap size, and calling `Max-Heapify()` on the new (possibly incorrectly-placed) root.
- Repeat this "discarding" process until only one node (the smallest element) remains, and therefore is in the correct place in the array.

Let's use a concrete example to sort an unordered array using the heapsort algorithm. Consider the unordered array $A = [7, 4, 3, 1, 2]$ and run the heapsort algorithm on it.

<p align="center">
<img width="250" alt="array_unsorted" src="https://github.com/user-attachments/assets/959ebbb3-3c97-4a99-bb0d-c29e270ca514" />
</p>

Step 1: The first step is to build a Max-Heap from $A$.

<img width="1375" alt="heapsort1" src="https://github.com/user-attachments/assets/df8e1b26-b7ad-47dd-8735-37235183e7e8" />

Step 2: Initially $i=n-1 = 4$. Exchange $A[0]$ with $A[4]$ and "discard it"; Decrease heap-size by 1 and `Max-Heapify()` the remaining tree

<img width="1375" alt="heapsort2" src="https://github.com/user-attachments/assets/6bfd2488-89d2-4720-92c5-65c4da763019" />

Step 3: Current value of $i=3$. Exchange $A[0] with $A[3]$ and "discard it"; Decrease heap-size by 1 and `Max-Heapify()` the remaining tree

<img width="1375" alt="heapsort3" src="https://github.com/user-attachments/assets/6eccc68e-6fa7-43e2-bf81-f3ee8e1e9402" />

Step 4: Current value of $i=2$. Exchange $A[0] with $A[2]$ and "discard it"; Decrease heap-size by 1 and `Max-Heapify()` the remaining tree

<img width="1375" alt="heapsort4" src="https://github.com/user-attachments/assets/473db612-0384-4014-967a-6a280815902f" />

Step 5: Current value of $i=1$. Exchange $A[0] with $A[1]$ and "discard it"; Decrease heap-size by 1 and `Max-Heapify()` the remaining tree

<img width="1375" alt="heapsort5" src="https://github.com/user-attachments/assets/75e317a6-7f25-4adf-a63d-7865d931f469" />

Hence the sorted array is as follows:
<p align="center">
<img width="250" alt="array_sorted" src="https://github.com/user-attachments/assets/ddc71b60-dfe9-4ccc-a73c-8f7eaf202987" />
</p>

**Runtime**

As we found earlier, `Build-MaxHeap()` takes $O(n)$ time. 

The `for` loop runs $n-1$ times, each time calling exchange elements and `Max-Heapify()`. Exchange elements takes $O(1)$ time, while `Max-Heapify()` takes $O(\log n)$ time. Therefore, the `for` loop takes $O(n \log n)$ times. Hence the total runtime is $O(n \log n)$.

Though heapsort is a great algorithm, a well-implemented quicksort usually beats it in practice.

## Priority Queues

Heaps efficiently implement priority queues. We discuss max-priority queues implemented with max-heaps. Min-priority queues are implemented with min-heaps similarly.

- A priority queue maintains a dynamic set $S$ of elements
- Each set element has a **key**, which is an associated value for the element
- Max-priority queue supports the following operations:
  1. `insert`$(S, x, k)$: inserts element $x$ with key $k$ into set $S$.
  2. `maximum`$(S)$: returns element of $S$ with the largest key.
  3. `extract-max`$(S)$: removes and returns element of $S$ with the largest key.
  4. `increase-key`$(S, x, k)$: increases value of element $x$'s key to $k$.
- Example max-priority queue application: schedule jobs on a shared computer. The scheduler adds new jobs to run by calling `insert()` and runs the job with the highest priority among those pending by calling `extract-max()`.
- Min-priority queue supports similar operations:
  1. `insert`$(S, x, k)$: inserts element $x$ with key $k$ into set $S$.
  2. `minimum`$(S)$: returns element of $S$ with the smallest key.
  3. `extract-min`$(S)$: removes and returns element of $S$ with the smallest key.
  4. `decrease-key`$(S, x, k)$: decreases value of element $x$'s key to $k$.
- Example min-priority queue application: event-driven simulator. Events are simulated in order of time of occurrence by calling `extract-min()`.


## Python's heapq Module

The `heapq` module provides the Min-Heap implementation of the heap queue algorithm. Therefore, the smallest element is always at the root, `heap[0]`.

The `heap.sort()` function maintains the heap invariant.

To create a heap, use a list initialized to [], or you can transform a populated list into a heap via function `heapify()`.

The `heapq` module provides the following functions:

1. `heapq.heappush(heap, item)`: Push the value item onto the heap, maintaining the heap invariant.
2. `heapq.heappop(heap)`: Pop and return the smallest item from the heap, maintaining the heap invariant. If the heap is empty, `IndexError` is raised. To access the smallest item without popping it, use heap[0].
3. `heapq.heapify(A)`: Transform list $A$ into a heap, in-place, in linear time.


## My Solutions to Selected Exercises from CLRS

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

For a heap (both min-heap and max-heap), using 1-based indexing, the children of a node at index $k$ are at $2k$ and $2k+1$. Hence for the node at index $\lfloor n/2 \rfloor +1$, its left child will be at $2($\lfloor n/2 \rfloor +1) > n$, which is not possible as there are only $n$ elements in the heap. So, the node at index $\lfloor n/2 \rfloor +1$ must be a leaf. Using the same arguments we see that all the nodes indexed by $\lfloor n/2 \rfloor +1, \lfloor n/2 \rfloor +2, \ldots, n$ must be leaves. 

We also need to show that the previous node indexed by $k = \lfloor n/2 \rfloor$ is not a leaf. Its left child is indexed by $2k = 2  \lfloor n/2 \rfloor \leq n$. Therefore, the node indexed by $k = \lfloor n/2 \rfloor$ is not a leaf.
    
    
13. sdaffda

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
