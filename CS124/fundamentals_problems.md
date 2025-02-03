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

   *Proof*. We get the following values for $T(n)$ for the first few values of $n$:
   
   $$
        T(1) = 1, T(2) = 3, T(3) = 9, T(4) = 21, T(5) = 41, T(6) = 71, \ldots
   $$
   
   Guessing a closed form expression, we claim $T(n) = \frac{1}{3}n^3 - \frac{1}{3}n + 1.$

   Let's call our solution $T'(n) = \frac{1}{3}n^3 - \frac{1}{3}n + 1.$ We want to prove that $T'(n) = T(n)$ for all $n \geq1$ since this would mean our solution is fully correct. We prove this by induction as follows:

   **Base case**: $T'(1) = \frac{1}{3}(1)^3 - \frac{1}{3} + 1 = 1 = T(1)$. Our function correctly calculates $T(1)$.

   **Inductive Hypothesis**: Suppose it is true for some $n > 1$ that our formula correctly calculates $T(n-1)$, $T(n-1) = T'(n-1) = \frac{1}{3}(n-1)^3 - \frac{1}{3}(n-1) + 1$.

   **Inductive Step**: We can now show that our formula will also correctly calculate $T(n)$:

   $$
   T(n) = T(n-1) + n^2 - n = \frac{1}{3}(n-1)^3 - \frac{1}{3}(n-1) + 1 +n^2 - n = \frac{1}{3}n^3 - \frac{1}{3}n + 1.
   $$

   Therefore, our solution corrrectly calculates $T(n) = T'(n)$.

   **Conclusion**: By the principle of mathematical induction, our solution correctly calculates $T(n)$ for all $n \geq 1$.

   
7. Solve the following recurrence exactly, and then prove your solution is correct: $T(1) = 1, T(n) = 3T(n-1) -n + 1$.

   *Proof*: We get the following values for $T(n)$ for the first few values of $n$:
   $T(1) = 1, T(2) = 2, T(3) = 4, T(4) = 9, T(5) = 23, T(6) = 64, \ldots $
   Guessing a closed form solution, we claim $T(n) = \frac{1}{12} 3^n + \frac{n}{2} + \frac{1}{4}.$

   Let's call our solution $T'(n) = \frac{1}{12} 3^n + \frac{n}{2} + \frac{1}{4}$. We want to prove that $T'(n) = T(n)$ for all $n \geq 1$. We shall prove this by induction as follows:

   **Base case**: $T'(1) = \frac{1}{12} 3^1 + \frac{1}{2} + \frac{1}{4} = 1 = T(1)$. So, our solution correctly calculates $T(1)$.

   **Inductive Hypothesis**: Suppose it is true for some $n > 1$ that our formula correctly calculates $T(n-1)$, so $T(n-1) = T'(n-1) = \frac{1}{12} 3^{n-1} + \frac{n-1}{2} + \frac{1}{4}$.

   **Inductive Step**: We can now show that our formula will also correctly calculate $T(n)$:

   $$
   T(n) = 3T(n-1) - n + 1 = 3\left ( \frac{1}{12} 3^(n-1) + \frac{n-1}{2} + \frac{1}{4} \right ) - n + 1 = \frac{1}{12} 3^n + \frac{n}{2} + \frac{1}{4}.
   $$

   Therefore, we have shown it is true that $T(n) = T'(n)$.

   **Conclusion**: By the principle of mathematical induction, our solution correctly calculates $T(n)$ for all $n \geq 1$.

   *Hint*: The recursive function gives us a hint that the solution likely includes some variation of $3^n$. For this question, it is probably easiest to try writing $T(n)$ in terms of $T(n−1),T(n − 2),T(n−3),\ldots$ and noticing the pattern through repeated substitution. 

9. Give tight asymptotic bound for $T(n) = 9T(\lfloor n/3 \rfloor) + n^2 + 3n$ (i.e. $T(n) = \Theta(f(n))$ for some $f$).

    Using the Master Theorem, with $a = 9, b = 3, c = 1, k = 2$, $T(n) = \Theta(n^2 \log n)$.
   
11. Give tight asymptotic bound for $T(n) = 4T (\lfloor \sqrt{n} \rfloor ) + \log n$ (Hint: it may help to apply a change of variable).

    Let $T(2^n) = U(n)$. Now,

    $$
    U(n) = 4T \left ( 2^{n \times \frac{1}{2}} \right ) + \log_2(2^n) = 4U \left (\frac{n}{2} \right ) + n.
    $$

    Applying the Master Theorem to $U(n)$, with $a = 4, b = 2, c = 1, k = 1$,

    $$
    U(n) = \Theta \left (n^{\log_2 4} \right ) = \Theta (n^2).
    $$

    Hence, $T(n) = U(\log n) = \Theta \left ((\log n)^2 \right )$.
    
13. One of the simplest algorithms for sorting is BubbleSort - see code below.

    ```python
    def BubbleSort(A[0..n-1]):
       for i in range(len(A)):
          for j in range(len(A) - 1)):
             if $A[j] > A[j+1]:
                swap A[j] and A[j+1]
    ```


      In this problem we will study the behavior of a twisted version of BubbleSort, described below.
   
      ```python
          def TwistedBubbleSort(A[0..n-1]):
             for i in range(len(A)):
                for j in range(len(A))):
                   if $A[i] < A[j]:
                      swap A[i] and A[j]
      ```
      
      Your task is to prove that TwistedBubbleSort also correctly sorts every array. (While not necessary, you may assume for simplicity that the elements of $A$ are all distinct.)

    1. Explain in plain English why TwistedBubbleSort is different from BubbleSort.
      
       TwistedBubbleSort() compares $A[i]$ to $A[j]$ for *every* $i$ and $j$ and swaps them if $A[i] < A[j]$, while regular bubble sort only compares and swaps *adjacent elements* $A[j]$ and $A[j+1]$.

    2. Prove that after the $i$-th iteration of the outer loop, the largest element of $A$ is at the $i$-th index.
   
       During the $i$-th iteration of the loop, the elements at every index $j$ from $0\ldotsn-1$ are compared to $A[i]$ for $i$ ($i$ is constant for the duration of this iteration). If $A[j] > A[i]$, the elements at $i$ and $j$ get swapped. If $A[i]$ already holds the largest element, then no changes are made to the array, and at the end of the $i$-th iteration $A[i]$ continues to hold the largest element. Else, since we iterate through the entire array, there must exist some $A[j] > A[i]$ for some index $j$ that holds the largest element. These two elements must get swapped, after which $A[i]$ holds the largest element, following which there are no more swaps and this reverts to the first case, such that at
the end of the $i$-th iteration $A[i]$ then holds the largest element.
     
   - Prove that



14. adfsda
15. asdas

   

[Back to Fundamentals](./fundamentals.md)

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
