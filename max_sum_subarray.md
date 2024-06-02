### 1. Maximum Sub Subarray

***

Find the contiguous subarray of a given array $A$ such that it has the largest possible sum.

> **Example**: $A = [5, -2, 4, -10,  1, 7, -9, 8]$. The maximum sum subarray of $A$ is $[1, 7]$ and the maximum sum is 8.

How many possible contiguous subarrays of any size are there in an array of size $n$?

Using the above example, we see that there are 8 subarrays of length 1, namely $[5],  [-2], [4], [-10],  [1], [7], [-9]$ and  $[8]$. There are 7 subarrays of length 2, namely $[5, -2], [-2, 4], [4, -10], [-10, 1], [1, 7], [7, -9]$ and  $[-9, 8]$. In this manner, there will be 6 contiguous subarrays of length 3, and so on. Therefore, we see that there are $n + (n-1) + \cdots + 1 = n(n+1)/2$ contiguous subarrays of any size in an array of size $n$.

[Dynamic Programming](./dp.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
