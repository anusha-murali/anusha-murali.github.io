### Longest String of Consecutive Ones

**Problem**: Consider an array consisting of only 1's and 0's. You are allowed to substitute a maximum of $k$ 0's with 1's. Find the length of the longest consecutive 1's that is feasible.

*Example*: $A = [1,1,1,0,0,0,1,1,1,1,0] \text{ and } k = 2$.


*Answer*: 6.

The longest consecutive 1's for the above example is $A = [1,1,1,0,0,\textcolor{red}{1},1,1,1,1,\textcolor{red}{1}] $


```
def longestOnes(nums: list[int], k: int) -> int:
    zeroList = [i for i in range(len(nums)) if nums[i] == 0]
    zeroList.append(len(nums))
    start = 0
    end = zeroList[min(k, len(zeroList)-1)] - 1
    maxLen = end - start + 1
    for i in range(1, len(zeroList) - k):
        start = zeroList[i-1] + 1
        end = zeroList[i+k] - 1
        maxLen = max(end-start+1, maxLen)
    return maxLen
```



**Runtime**: $O(n)$.

[Back to Dynamic Programming Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
