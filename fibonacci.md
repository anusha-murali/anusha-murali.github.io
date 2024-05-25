### Fibonacci Sequence

**Problem**: The $n^{\text{th}}$ Fibonacci number is given by,

$$
F(n) = 
\begin{cases}
0 & \text{for }n=0\\
1 & \text{for }n=1\\
F(n-1) + F(n-2) & \text{for }n >1
\end{cases}
$$

Find the $n^{\text{th}}$ Fibonacci number.

#### Solution 1: Top-down Recursion

```
def fib(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fib(n-1) + fib(n-2)
```

What is the runtime of the above recursive solution?

Let $T(n)$ be the number of addition operations the above function requires in order to compute $F(n)$. We note that $T(0) = 0$ and $T(1) = 1$. In order to compute $F(n), n \geq 2$, we need to compute $F(n-1)$ and $F(n-2)$ and do one addition. Therefore, we have,

$$
T(n) = T(n-1) + T(n-2) + 1
$$

We can prove by induction that $F(n) = 2^{\Theta(n)}$.

**Lemma 1**. *For $n > 5, 2^{n/2} \leq F(n) \leq 2^n$.

*Proof*. We can verify that the above inequality for the base cases of $n=6$ and $n=7$.  Now, let us assume that the above inequality holds for all $F(n), n \geq 6$. Hence, we find,

$$
F(n) = F(n-1) + F(n-2) \leq 2^{n-1} + 2^{n-2} \leq  2^{n-1} + 2^{n-1} \leq 2^n.
$$

Similarly,

$$
F(n) = F(n-1) + F(n-2) \geq 2^{(n-1)/2} + 2^{(n-2)/2} \geq  2^{(n-2)/2} + 2^{(n-2)/2} \geq 2^{n/2}.
$$

Hence, the Fibonacci numbers grow exponentially. Hence the runtime of the recursive solution is $2^{\Theta(n)}$.

#### Dynamic Programming with Memoization

The reason why the recursive solution above has an exponential runtime is that it repeatedly calculates the subproblems. By saving the results of each subproblem in an array (memoization), we can avoid repeated calculations of the subproblems. We now have the following solution:

```
def fib(n):
    f = [0, 1]
    for i in range(2, n+1):
        f.append(f[i-1] + f[i-2])
    return f[n]
```

**Runtime**: Unlike Solution 1, the memoized version above solves each subproblem only once. Since there are only $n-1$ additions, the runtime is $O(n)$.

[Dynamic Programming](./dp.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
