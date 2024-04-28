# Randomized Algorithms

## 1. Primality Testing and Factoring

### 1.1. Fermat's Little Theorem

Fermat's little theorem states that for a prime number $p$ and a co-prime integer $a$ (i.e: $(a, p) = 1$),  the following equation holds:

$$
a^{p-1} \equiv 1 \pmod{p}
$$

When the above equation doesn't hold, we know for certain that $p$ is not a prime and the value of $a$, for which the above equation failed is known as a Fermat witness for the compositeness of $p$.  However, $a^{p-1} \equiv 1 \pmod{p}$ does not necessarily guarantee that $p$ is a prime as the equation holds for certain composite numbers (such as Carmichael numbers).

### 1.2. Rabin Primality Test

Rabin's primality test can be used to find the compositeness of a number. 

Rabin testing says that if an odd number $n$ is a prime, the only solutions to $a^2 \equiv 1 \pmod{n}$ are $a \in \\{ \pm 1\\}$.  

Since $n$ is odd, $n-1$ is even. Therefore, we can represent $n-1$ as $n -1 = 2^i \cdot u$, where $u$ is odd. Suppose we choose a random base $a$ and compute $a^{n-1}$ by first computing $a^u$ and then repeatedly squaring. Along the way, we will check to see for the values, $a^u, a^{2u}, a^{4u}, \ldots$ and verify whether they have the following property:

$$
a^{2^{i-1}u} ~~ &\not \equiv ~~\pm 1 \pmod{n}\\
a^{2^i u} ~~ & \equiv ~~ 1 \pmod{n}.
$$

If we see the above property, we have encountered a non-trivial square root of $1 \pmod{n}$. Rabin primality test, presented in Theorem 2 of Lecture 17, says that only composite numbers have non-trivial square roots of $1 \pmod{n}$. For a random $2 \leq a  <  n -1$ ($a$ is relatively prime to $n$), we check whether $a^u \equiv 1 \pmod{n}$ or $a^{2^j \cdot u} \equiv 1 \pmod{n}, 0 \leq j \leq i -1$. If we found an $a$ which doesn't satisfy these properties, then we have found a witness for the compositeness of $n$, so $n$ is not a prime number.


[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
