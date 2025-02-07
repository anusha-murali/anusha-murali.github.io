### Minimum Cost of Climbing Stairs

**Problem**: You are given an integer array `cost` where `cost[i]` is the cost of ith step on a staircase. 
Once you pay the cost, you can either climb one or two steps.

You can either start from the step with index 0, or the step with index 1.

Return the minimum cost to reach the top of the floor.

Example 1:

Input: `cost = [10,15,20]`; Output: 15

Explanation: You will start at index 1. Pay 15 and climb two steps to reach the top. The total cost is 15.

Example 2:

Input: `cost = [1,100,1,1,1,100,1,1,100,1]`; Output: 6

<p align = "center">
<img width="480" alt="stairs" src="https://github.com/user-attachments/assets/0cd9aa04-9810-49dd-b817-879968d24db7" />
</p>

Explanation: You will start at index 0.
- Pay 1 and climb two steps to reach index 2.
- Pay 1 and climb two steps to reach index 4.
- Pay 1 and climb two steps to reach index 6.
- Pay 1 and climb one step to reach index 7.
- Pay 1 and climb two steps to reach index 9.
- Pay 1 and climb one step to reach the top.
The costs of the optimal stairs are indicated in red in the diagram above. The total cost is 6.

**Solution 1** Recursion

Let `minCost(n)` be the minimum cost to reach stair $n$. 

Hence `minCost(n) = cost(n) + min(minCost(n-1), minCost(n-2))`.

Hence, we have the following recursive solution:

```python
def minCost(n):
  if n < 2:
    return cost[n]
  return cost[n] + min(minCost(n-1), minCost(n-2))
```
Therefore, if the size of `cost` = $n$, we can find the minimum cost to reach the top of the stairs using:

```python
min(minCost(n-1), minCost(n-2))
```

**Solution 2** Dynamic Programming

The recursive solution above suffers from repeated recomuptation of the minimum costs. We can memoize the minimum cost to climb stair $i$ in an array and avoid the repeated recomputation of the minimum costs as follows:

```python
def minCostClimbingStairs(cost):
    dp = [0]*(len(cost))

    for i in range(len(cost)):
        dp[i] = cost[i] + min(dp[i-1],dp[i-2])

    return min(dp[len(cost)-1], dp[len(cost)-2])
```


**Runtime**: Unlike Solution 1, the memoized version above solves each subproblem only once. Since there are only $n-1$ additions, the runtime is $O(n)$.

[Back to Dynamic Programming Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
