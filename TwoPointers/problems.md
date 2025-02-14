<p align="center">
<img width="1375" alt="favorite_two_pointers" src="https://github.com/user-attachments/assets/0a738556-c0dd-4c7d-b93a-f2d26722f937" />
</p>

### Introduction

The "two pointer" solution approach is an algorithmic technique that uses two pointers (indices) to traverse a data structure like an array or linked list, often moving them in different directions, to efficiently solve problems by comparing elements at those positions and making decisions based on those comparisons, typically achieving a time complexity of $O(n)$ where $n$ is the size of the data structure; it's particularly useful for problems involving sorted arrays or finding pairs that meet certain conditions. 


### Key points about the two pointer approach

1. **Two pointers**: Two variables are used as pointers, usually called "left" and "right", which point to different positions within the data structure.
2. **Movement based on conditions**: Depending on the problem, one or both pointers move forward or backward based on the comparison between the elements they point to.
3. **Efficient traversal**: By only accessing elements ***once***, this approach can significantly improve the time complexity compared to nested loops.

### Common use cases for the two pointer technique

#### Finding pairs with a target sum in a sorted array

Iterate through the array with one pointer at the beginning and one at the end, adjusting pointers based on whether the current sum is too large or too small compared to the target. 

#### Removing duplicates from a sorted array

Use two pointers, one to iterate through the array and another to mark the position where the next unique element should be placed. 

#### Finding the longest substring with unique characters

Maintain a "sliding window" using two pointers to track the start and end of the window, adjusting the window size as needed. 

#### Checking for a palindrome

Use two pointers, one at the beginning and one at the end of the string, to compare characters and move inwards. 

#### Example: Finding two numbers that sum to a target in a sorted array

```python
def two_sum(nums, target):
    left, right = 0, len(nums) - 1
    while left < right:
        current_sum = nums[left] + nums[right]
        if current_sum == target:
            return [left, right]
        elif current_sum < target:
            left += 1
        else:
            right -= 1
    return [] 
```


1. [Container with Most Water](./11.md)
2. [Valid Palindrome](./125.md)
3. [Maximum Number of $k$-sum Pairs](./1679.md)
4. [Move Zeroes](./283.md)
5. [Is Subsequence?](./392.md)
6. [Assign Cookies](./455.md)
7. [Squares of a Sorted Array](./977.md)
8. [Linked List Cycle](./141.md)
9. [Trapping Rain Water](./42.md)
10. [Merge Sorted Array](./88.md)


* * *
###### anusha-murali.github.io


<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)

