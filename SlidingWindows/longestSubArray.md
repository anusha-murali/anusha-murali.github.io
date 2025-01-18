### Longest Subarray of 1's After Deleting One Element

This is a beautiful LeetCode problem (Problem #1493).

**Problem**: Given a binary array nums, you should delete one element from it.

Return the size of the longest non-empty subarray containing only 1's in the resulting array. 
Return 0 if there is no such subarray.

Example 1:

Input: `nums = [1, 1, 0, 1]`; Output: 3;

Explanation: After deleting the number in position 2, `[1,1,1]` contains 3 numbers with value of 1's.

Example 2:

Input: `nums = [0,1,1,1,0,1,1,0,1]`; Output: 5

Explanation: After deleting the number in position 4, `[0,1,1,1,1,1,0,1]` longest subarray with value of 1's is `[1,1,1,1,1]`.

Example 3:

Input: `nums = [1,1,1]`; Output: 2

Explanation: You must delete 1 element.

**Solution**

We create a new list called `zeroList` that contains the positions of the 0's in `nums`. Using list comprehension, we can create this list as follows:
```
        zeroList = [i for i in range(len(nums)) if nums[i] == 0]
```
If all the elements in `nums` are zero, then we return 0. If there are no 0's or only one 0 in `nums`, then we return `len(nums) - 1` as we must delete 1 element.

Otherwise, we iterate through all the elements in the `zeroList` and determine the length of the longest subarray of 1's after deleting the 0 at the current position. 

For an element in the `zeroList`, which is neither the first or the last, the length of the longest subarray of 1's after deleting the 0 at the current position is `curLen = zeroList[k+1] - zeroList[k-1] - 2`. 

For the first element in the `zeroList`, this length is `curLen = zeroList[1] - 1`.

For the last element in the `zeroList`, this length is `curLen = len(nums) - zeroList[k-1] - 2`.

Putting these all together, we have the following solution:

```
  def longestSubarray(nums: List[int]) -> int:
        zeroList = [i for i in range(len(nums)) if nums[i] == 0]

        if len(zeroList) == len(nums):
            return 0
        if len(zeroList) <= 1:
            return len(nums) - 1

        maxLen = 0
        for k in range(len(zeroList)):
            if k == 0:
                curLen = zeroList[1] -1
            elif k == len(zeroList) - 1:
                curLen = len(nums) - zeroList[k-1] - 2
            else:
                curLen = zeroList[k+1] - zeroList[k-1] - 2
            if curLen > maxLen:
                maxLen = curLen
        return maxLen
```

**Runtime**: The runtime is $O(n)$ as we iterate through `nums` to generate the `zeroList` once and then we iterate through the `zeroList` once to find the longest subarray. The space complexity is also $O(n)$ as the number of elements in `zeroList` is $\leq n$.

[Back to Sliding Window Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
