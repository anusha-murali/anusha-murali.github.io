### Maximum Subsequence Score

This is a beautiful problem from LeetCode (Problem #2542). Although this problem is categorized as a "medium" difficulty
problem, I believe it should be moved to the "hard" category.

**Problem**: You are given two $0$-indexed integer arrays `nums1` and `nums2` of equal length $n$ and 
a positive integer $k$. You must choose a subsequence of indices from `nums1` of length $k$.

For chosen indices $i_0, i_1, \ldots, i_{k - 1}$, your score is defined as:

The sum of the selected elements from `nums1` multiplied with the minimum of the selected elements 
from `nums2`.
It can be defined simply as: 

$$
({\tt nums1}[i_0] + {\tt nums1}[i_1] + \cdots + {\tt nums1}[i_{k - 1}]) \times  \min({\tt nums2}[i_0] , {\tt nums2}[i_1], \cdots ,{\tt nums2}[i_{k - 1}]).
$$

Return the maximum possible score.

A subsequence of indices of an array is a set that can be derived from the set $\{0, 1, \ldots, n-1\}$ by deleting some or no elements.

 

**Example 1**:

Input: nums1 = [1,3,3,2], nums2 = [2,1,3,4], $k = 3$; Output: 12.

Explanation: The four possible subsequence scores are:
- We choose the indices 0, 1, and 2 with score = (1+3+3) * min(2,1,3) = 7.
- We choose the indices 0, 1, and 3 with score = (1+3+2) * min(2,1,4) = 6. 
- We choose the indices 0, 2, and 3 with score = (1+3+2) * min(2,3,4) = 12. 
- We choose the indices 1, 2, and 3 with score = (3+3+2) * min(1,3,4) = 8.
  
Therefore, we return the max score, which is 12.

**Example 2**:

Input: nums1 = [4,2,3,1,1], nums2 = [7,5,10,9,6], $k = 1$; Output: 30.

Explanation: 
Choosing index 2 is optimal: nums1[2] * nums2[2] = 3 * 10 = 30 is the maximum possible score.

**Solution Using MinHeap**

We are asked to select $k$ indices from the set $\{0, 1, \ldots, n-1\}$ in such a way that the sum of 
integers from `nums1` corresponding to those $k$ indices multiplied by the minimum value among the $k$ integers from `nums2` corresponding to those $k$ indices is the maximum possible.

There are $\binom{n}{k}$ distinct sets of $k$ indices that can be selected from $n$ indices. This is exponential on $n$, which means, a brute-force approach examining all the $\binom{n}{k}$ possiblities will lead to exponential runtime.

We use the following approach to significantly reduce the runtime.

1. We create a single list of $n$ elements, where each element is the pair `(nums1[i], nums2[i])`.
```python
list(zip(nums1, nums2))
```
2. We order the above paired list using the elements of `nums2` in descending order. This ensures that we prioritize elements with larger `num2` values.
```python
pairedSortedList = sorted(list(zip(nums1, nums2)), key=lambda x: -x[1])
```
3. We maintain a min-heap of maximum size $k$. We note that each time we insert a new pair `(nums1[i], nums2[i])`, the current minimum value of `nums2` in the min-heap is `nums2[i]` and the current sum of the $k$ values in the min-heap is simply `sum(min-heap)`. The min-heap allows us to efficiently maintain the su of the largest $k$ elements.

Our Python code is as follows:

```python
def maxScore(nums1, nums2, k):
    import heapq

    pairedSortedList = sorted(list(zip(nums1, nums2)), key=lambda x: -x[1])
    currSum = currMax = 0
    minHeap = []
    for n1, n2 in pairedSortedList:
        heapq.heappush(minHeap, n1)
        currSum += n1
        if len(minHeap) == k:
            currMax = max(currMax, currSum * n2)
            currSum -= heapq.heappop(minHeap)
    return currMax
```

**Intuition**: The `pairedSortedList` in our algorithm is a sorted list on `nums2` in descending order, which allows us to maximize the minimum value of `nums2`.  Let us consider a concrete example, with $n = 5$ and $k = 3$. The first full min-heap will have the three `(nums1, nums2)` pairs, where the `nums2` correspond to the largest 3 of the 5. The smallest of the 3 `nums1` will be found at the root of the min-heap, which will be removed in the next iteration and will be replaced with another `(nums1, nums2)` pair. Since `pairedSortedList` is sorted in descending order, the `nums2` in the newly added pair will be smaller than either the one that was just removed or smaller than the two that are still present in the min-heap. Since we are dealing with `(nums1, nums2)` pairs, iterating through the `pairedSortedList` dictates which of the 3 `nums1` could be present in the min-heap during each iteration of the for loop.

Therefore, we see that this algorithm explores all possible values of the minimum `nums2` in a systematic way (from largest to smallest). For each value of the minimum `nums2`, it maximizes the sum of the corresponding `nums1` elements.


**Proof of Correctness**

1. Subset Selection
   - The algorithm selects a subset of size k by iterating through the sorted tuples and maintaining the top k elements from nums1 using a min-heap.
   - At each step, the subset is valid because: (a) The size of the heap is always k after processing the first k elements. (b) The subset is derived from the original arrays by selecting indices in a valid way.
     
2. Score Calculation
   - The score is calculated as:

     $$
        \text{score} = \left ( \sum_{i \in S} \text{nums1}[i] \right ) \times \min_{i \in S} \text{nums2}[i].
     $$
   - The algorithm ensures that (a) the sum of the selected `nums1` elements is maximized for the current `nums2` value (since we use a min-heap to keep the largest `nums1` elements). (b) The `nums2` value used in the calculation is the minimum in the current subset (because the tuples are sorted in descending order of `nums2`).

**Proof of Optimality**

1. Sorting by `nums2`
   - Sorting the tuples in descending order of `nums2` ensures that when we consider a subset of size $k$, the minimum `nums2` value in the subset is as large as possible.
   - This is because the `nums2` values are processed in descending order, so the minimum `nums2` value in any subset is determined by the smallest `nums2` value in the subset.
2. Greedy Selection of `nums1` Elements
   - By using a min-heap to maintain the top $k$ elements from `nums1`, we ensure that the sum of the selected `nums1` elements is maximized for the current `nums2` value.
   - If a better subset exists (with a larger sum of `nums1` elements for the same `nums2` value), the min-heap ensures that we always keep the largest possible sum.
3. Maximizing the Score
   - The score is the product of two terms: (1) The sum of the selected `nums1` elements and (2) the minimum `nums2` value in the subset.
   - By iterating through the sorted tuples and computing the score at each step, we ensure that we consider all possible subsets where the minimum `nums2` value is as large as possible.
   - The algorithm guarantees that the maximum score is found because: (1) It explores all possible values of the minimum `nums2` in a systematic way (from largest to smallest). (2) For each value of the minimum `nums2`, it maximizes the sum of the corresponding `nums1` elements.

**Inductive Argument**

Base Case:

  - For $k=1$, the algorithm selects the element with the largest `nums1[i] * nums2[i]`, which is clearly optimal.

Inductive Step:

  - Assume the algorithm works optimally for subsets of size $k−1$.
  - For subsets of size $k$, the algorithm builds on the optimal subset of size $k−1$ by adding the next best element (in terms of `nums1` and `nums2`).
  - The min-heap ensures that the sum of the selected `nums1` elements is maximized for the current `nums2` value.


**Runtime**: The time complexity is $O(n \log n)$ due to sorting and the min-heap operations. The space complexity is $O(n)$ for storing the pairs and the min-heap.

[Back to Heap and Priority Queue Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
