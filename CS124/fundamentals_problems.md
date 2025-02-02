<img width="1375" alt="favorite_fundamentals" src="https://github.com/user-attachments/assets/894cbd0a-270b-4fbc-b551-cf0bc43b5697" />


1. Make all true statements of the form $f_i \in o(f_j)$, $f_i \in O(f_j)$, $f_i \in \omega(f_j)$, and $f_i \in \Omega(f_j)$ that hold for $i \le j$, where $i, j \in \{1,2,3,4,5\}$ for the following functions. No proof is necessary. All logs are base 2 unless otherwise specified.
   - $f_1 = (\log n)^{\log n}$
   - $f_2 = 2^{\sqrt{\log n}}$
   - $f_3 = 2^{2^{\sqrt[3]{\log\log\log n}}}$
   - $f_4 = n^{\log\log n}$
   - $f_5 = (\log\log n)^n$
  
   Ordering from smallest to largest, we have $f_3, f_2, f_1$ and $f_4$, then $f_5$. Rows in the table below denote the LHS of an order relation (e.g. $f_1 \in \Omega(f_2))$.
   

   |     | $f_1$     | $f_2$          | $f_3$          | $f_4$    |$f_5$ |
   |-----|-----------|----------------|----------------|----------|------|
   |$f_1$|$O, \Omega$|$\Omega, \omega$|$\Omega, \omega$|$O,\Omega$|$O, o$|
   |-----|-----------|----------------|----------------|----------|------|
   |$f_2$|           |$O, \Omega$     |$\Omega, \omega$|$O, o$    |$O, o$|
   |-----|-----------|----------------|----------------|----------|------|
   |$f_3$|           |                |$O, \Omega$     |$O, o$    |$O, o$|
   |-----|-----------|----------------|----------------|----------|------|
   |$f_4$|           |                |                |$O,\Omega$|$O, o$|
   |-----|-----------|----------------|----------------|----------|------|
   |$f_5$|           |                |                |          |$O, \Omega$|
 

   And the minimum number occurs 

   
3. Give an example of a function $f_6: \mathbb{N} \to \mathbb{R}^+$ for which *none* of the four statements $f_i \in o(f_6)$, $f_i \in O(f_6)$, $f_i \in \omega(f_6)$, and $f_i \in \Omega(f_6)$ is true for any $i \in \{1,2,3,4,5\}$.

   $$
f_6(n) = \begin{cases}
            1, \text{for odd }n\\
            n^n, \text{for even }n
         \end{cases}
   $$
   
5. Solve the following recurrence exactly, and then prove your solution is correct: $T(1) = 1, T(n) = T(n-1) + n^2 -n$.

   We get the following values for $T(n)$ for the first few values of $n$:
   
   $$
        T(1) = 1, T(2) = 3, T(3) = 9, T(4) = 21, T(5) = 41, T(6) = 71, \ldots
   $$
   
   Guessing a closed form expression, we claim $T(n) = \frac{1}{3}n^3 - \frac{1}{3}n + 1.$

   *Proof*. Let's call our solution $T'(n) = \frac{1}{3}n^3 - \frac{1}{3}n + 1.$ We want to prove that $T'(n) = T(n)$ for all $n \geq1$ since this would mean our solution is fully correct. We prove this by induction as follows:

   **Base case**: $T'(1) = \frac{1}{3}(1)^3 - \frac{1}{3} + 1 = 1 = T(1)$. Our function correctly calculates $T(1)$.

   **Inductive Hypothesis**: Suppose it is true for some $n > 1$ that our formula correctly calculates $T(n-1)$, $T(n-1) = T'(n-1) = \frac{1}{3}(n-1)^3 - \frac{1}{3}(n-1) + 1$.

   **Inductive Step**:

   
7. dads
8. asdf

   

[Back to Fundamentals](./fundamentals.md)

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
