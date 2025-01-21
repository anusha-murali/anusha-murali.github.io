### Professional Robber

***

This is my solution for the House Robber problem from LeetCode (Problem #198).

**Problem**: You are a professional robber planning to rob houses along a street. Each house has a certain amount 
of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security 
systems connected and it will automatically contact the police if two adjacent houses were broken into on the same 
night.

Given an integer array `nums` representing the amount of money of each house, return the maximum amount of money you 
can rob tonight without alerting the police.

Example 1:

Input: `nums = [1,2,3,1]`; Output: 4

Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3). Total amount you can rob = 1 + 3 = 4.

Example 2:

Input: `nums = [2,7,9,3,1]`;  Output: 12

Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
Total amount you can rob = 2 + 9 + 1 = 12.


### Solution 1: Top-down Recursion

In order to find the best plan that maximizes his loot, the robber proceeds as follows. His recursion algorithm is called `rob()`, which takes an array of integers as input and returns the maximum amount of loot he can get without triggering a police alert.

He first starts at House 0, which has `nums[0]` amount of money, and calls `rob()` on `nums[2:]` as he cannot rob the adjacent house. `rob(nums[2:])` returns the maximum possible amount looted starting from House 2. So, the total he could optimally loot starting from House 0 is `nums[0] + rob(nums[2:])`. He stores this in `loot` and `nums[0] + rob(nums[2:])` is larger than $-\infty$.

He then moves to House 1, which has `[nums[1]` amount of money, and calls `rob()` on `nums[3:]` as he cannot rob the adjacent house. `rob(nums[3:])` returns the maximum possible amount looted starting from House 3. So, the total he could optimally loot starting from House 1 is `nums[1] + rob(nums[3:])`. He compares this to current `loot` and updates `loot` with `max(loot, nums[i] + rob(nums[i+2:]))`, where `i = 1`. He continues in this manner.

Hence, the code for the top-down recursion is as follows:

```
def rob(nums):
    if len(nums) == 0:
        return 0
    loot = float('-inf')
    for i in range(len(nums)):
        loot = max(loot, nums[i] + rob(nums[i+2:]))
    return loot
```

This problem is similar to the Rod Cutting problem and therefore the time complexity is exponential in $n$.

### Solution 2: Dynamic Programming with Memoization

This approach is identical to the top-down recursive solution above, except that we will save the result of each subproblem. Each recursive call now first checks to see whether it has previously solved this subproblem. If so, it returns the saved value, which avoids repeated calculations of the subproblem; if not, it computes the value and saves it.

We save the revenues for each length from 0 to $n$ in array `r[0..n]`. 

```
def cutRod(p, n):
    r = [0 for i in range(n+1)]  # Initialize revenue to 0
    return cutRodMemoized(p, n, r)

def cutRodMemoized(p, n, r):
    if n==0:
        q = 0
    else:
        if r[n] > 0:   # If maximal r[n] was already computed, return it
            return r[n]

        q = float('-inf')
        for i in range(1, n+1):
            q = max(q, p[i] + cutRodMemoized(p, n-i, r))
        r[n] = q       # Save the maximal revenue for current n
    return q
```
**Runtime**: Unlike Solution 1, the memoized version solves each subproblem only once. We note that the for loop results in an arithmetic series, which therefore results in a runtime of $\Theta(n^2)$. 

### Solution 3: Dynamic Programming Bottom-up Approach

In the bottom-up approach, we solve the sub-problems of sizes $i = 0, 1, \ldots, n$ in increasing order. Hence, when a problem of size $k$ is encountered, it can make use of all the sub-problems of size $i < k$, as they have been already been computed. The results of the subproblems are saved in the revenue array $r$, where we initialize $r[0] = 0$ as there is no revenue from a rod of lengh 0.

We cut a piece of length $i$ (outer for loop) from the left end of the rod, and then find the maximum possible revenue for the remaining length of $j = n-i$ by iterating through every possible ways to cut it (inner for loop).

```
def cutRod(p, n):    
    r = [0 for i in range(n+1)]   
    for i in range(1, n+1):
        q = float('-inf')
        for j in range(1, i+1):
            q = max(q, p[j] + r[i-j])
        r[i] = q       
    return r[n]
```

**Runtime**: Due to the doubly-nested loop structure, the bottom-up `cutRod()` has a runtime of $\Theta(n^2)$. 

### Reconstructing the solution

In addition to finding the maximum possible revenue for a give rod length, we are also interested in finding the lengths of pieces, which led to the maximum revenue.

We use one additional array, $s[0 \cdots n]$, which saves the optimal size of the first piece that was cut.

```
def cutRod(p, n):
    r = [0 for i in range(n+1)]
    s = [0 for i in range(n+1)]
    for i in range(1, n+1):
        q = float('-inf')
        for j in range(1, i+1):
            if (q < p[j] + r[i-j]):
                q = p[j] + r[i-j]
                s[i] = j
        r[i] = q
    return (r, s)

def printCuts(p, n):
    (r, s) = cutRod(p, n)
    while n > 0:
        print(s[n])
        n = n - s[n]
```

> **Example**: Let $p = [0, 2, 7, 8, 10]$. Hence `printCuts(p, 3)` returns 1, 2, so the revenue is $p[1] + p[2] = 2 + 7 = \\$9$.  `printCuts(p, 4)` returns 2, 2, so the revenue is $p[2] + p[2] = 7 + 7 = \\$14$.


[Back to Dynamic Programming Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
