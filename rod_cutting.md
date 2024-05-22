### 1. Rod Cutting

***

**Problem**: A steel shop sells rods of different *integer* lengths, which are cut from a long steel rod. The shop charges $p_i$ dollars for a rod of length $i$. The shop wants to sell the rod pieces in such a way so as to maximize its revenue.

Let us say that the shop has a rod of length $n$, which the owner wants to cut into lengths $i_1, i_2, \ldots, i_k$, $1 \leq k \leq n$, in such a way so as to maximize the revenue. So, we have,

$$
n = i_1 + i_2 + \cdots + i_k,
$$

and the corresponding maximum revenue is,

$$
r_n = p_{i_1} + p_{i_2} + \cdots + p_{i_k}.
$$

> **Example**: For example, consider the price list, $p = [0, 2, 7, 8, 10]$. This indicates the price of a 0 length rod is \\$0, the price of length 1 is \\$2, the price of length 2 is \\$7 and so on. 


**Optimal Substructure**: We note that this problem exhibits the *optimal substructure* property - in order to solve the original problem of size $n$, we solve the same problem on smaller sizes. In other words, once we make a cut, we can consider the two pieces as independent instances of the rod-cutting problem. For example, if we cut the rod into lengths of $k$ and $n-k$, then we find the optimum revenues $r_k$ and $r_{n-k}$ of further cutting the two pieces, for a total revenue of $r_n = r_k + r_{n-k}$.

We can cut a rod of length $n$ in $2^{n-1}$ ways (either cut or not cut at each of the $n-1$ integer lengths).

For example, for a rod of length = 4, if $p = [0, 2, 7, 8, 10]$, then we have the following $2^3 = 8$ possible cuts:

<p align="center">
<img width="600" alt="rod_cutting" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/531609ca-1f25-42de-a4c6-78ce1459fd1a">
</p>

Therefore, for each of the $2^{n-1}$ cuts, we cut the rod into a left piece of length $i$, which can be sold for $p_i$, and sell the remaining length $n-i$ for an optimal revenue of $r_{n-i}$. Hence, we have the following recurrence:

$$
r_n = 
\begin{cases}
0 & \text{for }n = 0\\
\displaystyle{\max_{1 \leq i \leq n}} (p_i + r_{n-i}) & \text{for } n > 0
\end{cases}
$$


### Solution 1: Top-down Recursion

```
def cutRod(p, n):
    if n==0:
        return 0
    q = float('-inf')
    for i in range(1, n+1):
        q = max(q, p[i] + cutRod(p, n-i))   
    return q
```

> **Example**: Let $p = [0, 2, 7, 8, 10]$. Hence `cutRod(p, 3)` returns 9 and `cutRod(p, 4)` returns 14.

Let's say that we are calling `cutRod()` for $n=4$, How many total number of calls to `cutRod()` will be made? When the first call to `cutRod()` is made, the for loop calls `cutRod()` $n$ times, for $i = 0$ to $i=3$. So, we obtain the following recursion tree:

<p align="center">
<img width="500" alt="recursion_tree" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/5198bf47-c8a4-4fd6-80ed-92200d399ece">
</p>

For $n = 30$, on my Mac Mini, the above function takes at least 2 minutes to return the optimal value. 

Why is this approach so inefficient? This is because, `cutRod()` calls itself recursively over and over again with the same parameter values. In other words, it solves the same subproblems repeatedly. Let $T(n)$ be the total number of calls to `CutRod()`. We have the following recursion:

$$
T(n) = 
\begin{cases}
1 & \text{for }n = 0\\
1 + \displaystyle{\sum_{k = 0}^{n-1}} T(k) & \text{for } n > 0
\end{cases}
$$

We can guess that $T(n) = 2^n$ is a solution to the above recurrence. For $n=0$, $2^0 = 1$. For $n>0$, we find,

$$
T(n) = 1 + \displaystyle{\sum_{k = 0}^{n-1}} T(k) = 1 + \displaystyle{\sum_{k = 0}^{n-1}} 2^k = 1 + (2^n -1) = 2^n.
$$

Hence the time complexity of the top-down recursive `cutRod()` is exponential in $n$.

### Solution 2: Dynamic Programming with Memoization

This approach is identical to the top-down recursive solution above, except that we will save the result of each subproblem. Each recursive call now first checks to see whether it has previously solved this subproblem. If so, it returns the saved value, which avoids repeated calculations of the subproblem; if not, it computes the value and saves it.

We save the revenues for each length from 0 to $n$ in array `r[0..n]`. 

```
def cutRod(p, n):
    r = [0 for i in range(n+1)]
    for i in range(n+1):
        r[i] = 0  # Initialize revenue to 0
    return cutRodMemoized(p, n, r)

def cutRodMemoized(p, n, r):
    if r[n] > 0:   # If r[n] was already computed, return it
        return r[n]
    if n==0:
        q = 0
    else:
        q = float('-inf')
    for i in range(1, n+1):
        q = max(q, p[i] + cutRodMemoized(p, n-i, r))
    r[n] = q
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


[Dynamic Programming](./dp.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
