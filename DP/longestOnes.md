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

Since there are $\binom{m}{k}$ ways to select $k$ 0's out of a total of $m$ 0's, the naive and brute force approach is exponential. Therefore, one approach is to transform the problem into windows of 1's, demarcated by 0's. These
windows are represented by the `zeroList` array above. Each entry in the `zeroList`
corresponds to the index of the respective zero. We can use Python's *list comprehension* to 
create the `zeroList` efficiently, as well as compactly in one line. The **for** loop only scans the shorter `zeroList`, each 
time allowing at most $k$ 0's in the window and updating the maximum length if the length
of the current consecutive 1's was found to be larger than the current `maxLen`. Upon
exiting the **for** loop, `maxLen` contains the length of the maximum number of consecutive
1's in the array with at most $k$ 0's.



**Runtime**: $O(n)$ as the {\bf for} loop iterates only `len(zeroList)`$-k -1$ times, where `len(zeroList` $\leq n$}. . Space complexity is also $O(n)$.

[Back to Dynamic Programming Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
