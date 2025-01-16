### Finding $n^{th}$ Catalan Number

**Problem**: The $n^{\text{th}}$ Fibonacci number is given by,

$$
C_n = C_0 C_{n-1} + C_1 C_{n-2} + C_2 C_{n-3} + \cdots + C_{n-1} C_0.
$$

First few Catalan numbers are:

$$
\begin{align*}
C_0 &= 1\\
C_1 &= C_0 C_0 = 1 \cdot 1 = 1, \\
C_2 &= C_0 C_1 + C_1 C_0 = 1 \cdot 1 + 1 \cdot 1 = 2, \\
C_3 &= C_0 C_2 + C_1 C_1 + C_2 C_0 = 1 \cdot 2 + 1 \cdot 1 + 2 \cdot 1 = 5, \\
C_4 &= C_0 C_3 + C_1 C_2 + C_2 C_1 + C_3 C_0 = 1 \cdot 5 + 1 \cdot 2 + 2 \cdot 1 + 5 \cdot 1 = 14, \\
\vdots
\end{align*}
$$

Find the $n^{\text{th}}$ Catalan number.


#### Dynamic Programming with Memoization

The reason why the recursive solution above has an exponential runtime is that it repeatedly calculates the subproblems. By saving the results of each subproblem in an array (memoization), we can avoid repeated calculations of the subproblems. We now have the following solution:

```
def catalan(n):
    catList = [1]
    for k in range(1,n+1):
        total = 0
        for i in range(k):
            total += catList[i] * catList[k-1-i]
        catList.append(total)
    return catList[n]
```

**Runtime**: The total number of additions and multiplications done by the two `for` loops result in a runtime of $O(n^2)$.

[Back to Dynamic Programming Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
