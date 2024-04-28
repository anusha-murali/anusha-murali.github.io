# Fundamentals

## 1. Asymptotic Notation

<img width="856" alt="asymptotic" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/cb2a42a0-56f8-4d5c-ac7e-4f37d72f9967">


### $\Theta$-notation

The $\Theta$-notation asymptotically bounds a function from above and below.

$\Theta(g(n)) = \\{f(n):$ there exist positive constants $c_1, c_2$ and $n_0$ such that $0 \leq c_1g(n) \leq f(n) \leq c_2g(n)$ for all $n \geq n_0 \\}$.

### $O$-notation

When we have only an **asymptotic upper bound**, we use $O$-notation.

$O(g(n)) = \\{f(n):$ there exist positive constants $c$ and $n_0$ such that $0  \leq f(n) \leq cg(n)$ for all $n \geq n_0 \\}$.


### $\Omega$-notation

$\Omega$-notation provides an **asymptotic lower bound**.

$\Omega(g(n)) = \\{f(n):$ there exist positive constants $c$ and $n_0$ such that $0  \leq  cg(n) \leq f(n)$ for all $n \geq n_0 \\}$.


**Theorem**: For any two functions $f(n)$ and $g(n)$, we have $f(n) = \Theta(g(n))$ if and only if $f(n) = O(g(n))$ and $f(n) = \Omega(g(n))$.

## 2. Master Theorem

$$
T(n) = a \cdot T \left( \frac{n}{b} \right) + \Theta(n^c)
$$




[Table of Contents](./index.md)
<!--
![111596338](https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002)
-->

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
