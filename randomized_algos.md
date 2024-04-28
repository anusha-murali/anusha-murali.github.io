# Randomized Algorithms

## 1. Primality Testing and Factoring

### 1.1 Fermat's Little Theorem

Fermat's little theorem states that for a prime number $p$ and a co-prime integer $a$ (i.e: $(a, p) = 1$),  the following equation holds:

$$
a^{p-1} \equiv 1 \pmod{p}
$$

When the above equation doesn't hold, we know for certain that $p$ is not a prime and the value of $a$, for which the above equation failed is known as a Fermat witness for the compositeness of $p$.  However, $a^{p-1} \equiv 1 \pmod{p}$ does not necessarily guarantee that $p$ is a prime as the equation holds for certain composite numbers (such as Carmichael numbers).



[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
