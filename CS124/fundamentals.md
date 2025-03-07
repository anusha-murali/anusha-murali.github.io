# Fundamentals

## 1. Asymptotic Notation

<!---
<img width="856" alt="asymptotic" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/cb2a42a0-56f8-4d5c-ac7e-4f37d72f9967">
-->

<img width="856" alt="asymptotes" src="https://github.com/user-attachments/assets/06b25960-71da-4980-ba0d-f2445a6f1fc0" />


### 1.1. $O$-notation

When we have only an **asymptotic upper bound**, we use $O$-notation.

$O(g(n)) = \\{f(n):$ there exist positive constants $c$ and $n_0$ such that $0  \leq f(n) \leq cg(n)$ for all $n \geq n_0 \\}$.

$g(n)$ is an ***asymptotic upper bound*** for $f(n)$.

> **Example**:
> $2n^2 = O(n^3)$, with $c = 1$ and $n_0 = 2$.
> 
> Examples of functions in $O(n^2)$:
> $f(n) = n^2, f(n) = n^2 + n, f(n) = 1000n^2 + 1000n,$
> $ f(n) = n, f(n) =  n/10000, f(n) =  n^{1.9999}, f(n) = n^2/{\lg \lg \lg n}$.

### 1.2. $\Omega$-notation

$\Omega$-notation provides an **asymptotic lower bound**.

$\Omega(g(n)) = \\{f(n):$ there exist positive constants $c$ and $n_0$ such that $0  \leq  cg(n) \leq f(n)$ for all $n \geq n_0 \\}$.

$g(n)$ is an ***asymptotic lower bound*** for $f(n)$.

> **Example**:
> $\sqrt{n} = \Omega(\lg n)$, with $c = 1$ and $n_0 = 16$.
> 
> Examples of functions in $\Omega(n^2)$:
> $n^2, n^2 + n, n^2 - n, 1000n^2 + 1000n, n^3, n^{2.00001}, n^2 \lg \lg \lg n, 2^{2^n}$.

### 1.3. $\Theta$-notation

The $\Theta$-notation asymptotically bounds a function from above and below.

$\Theta(g(n)) = \\{f(n):$ there exist positive constants $c_1, c_2$ and $n_0$ such that $0 \leq c_1g(n) \leq f(n) \leq c_2g(n)$ for all $n \geq n_0 \\}$.

**Theorem**: For any two functions $f(n)$ and $g(n)$, we have $f(n) = \Theta(g(n))$ if and only if $f(n) = O(g(n))$ and $f(n) = \Omega(g(n))$.

$g(n)$ is an ***asymptotically tight bound*** for $f(n)$.

> **Example**: $n^2/2 - 2n = \Theta(n^2)$, with $c_1 = 1/4, c2 = 1/2,$ and $n_0 = 8$.


### 1.4. $o$-notation

$o(g(n)) = \\{f(n):$ for any positive constant $c > 0$, there exists a constant $n_0 > 0$ such that $0  \leq f(n) < cg(n)$ for all $n \geq n_0 \\}$.

If $f(n) = o(g(n))$, then

$$
\lim_{n \rightarrow \infty} \frac{f(n)}{g(n)} = 0.
$$

> ***Example***
> $5n = o(n^2)$, but $5n^2 \neq o(n^2)$
>
> $n^{1.9999} = o(n^2)$, $n^2/\lg n = o(n^2)$, $n^2 \neq o(n^2)$ (just like $2 \not < 2$), $n^2/1000 \neq o(n^2)$.

### 1.5. $\omega$-notation

$\omega(g(n)) = \\{f(n):$ for any positive constant $c > 0$, there exists a constant $n_0 > 0$ such that $0  \leq  cg(n) < f(n)$ for all $n \geq n_0 \\}$.


If $f(n) = \omega(g(n))$, then

$$
\lim_{n \rightarrow \infty} \frac{f(n)}{g(n)} = \infty.
$$

>***Examples***: $n^{2.0001} = \omega(n^2)$, $n^2\lg n = \omega(n^2)$, $n^2 \neq \omega(n^2)$.
>
>$n^2/3 = \omega(n)$, but $n^2/3 \neq \omega(n^2)$

### 1.6. Comparing functions

Assuming that $f(n)$ and $g(n)$ are asymptotically positive, we have the following:

**Transitivity**

$f(n) = \Theta(g(n))\quad$ and $\quad g(n) = \Theta(h(n))\qquad$ imply $\qquad f(n) = \Theta(h(n))$,

$f(n) = O(g(n))\quad$ and $\quad g(n) = O(h(n))\qquad$ imply $\qquad f(n) = O(h(n))$,

$f(n) = \Omega(g(n))\quad$ and $\quad g(n) = \Omega(h(n))\qquad$ imply $\qquad f(n) = \Omega(h(n))$,

$f(n) = o(g(n))\quad$ and $\quad g(n) = o(h(n))\qquad$ imply $\qquad f(n) = o(h(n))$,

$f(n) = \omega(g(n))\quad$ and $\quad g(n) = \omega(h(n))\qquad$ imply $\qquad f(n) = \omega(h(n))$.

**Reflexivity**

$f(n) = \Theta(f(n))$,

$f(n) = O(f(n))$,

$f(n) = \Omega(f(n))$.


**Symmetry**

$f(n) = \Theta(g(n))$ if and only if $g(n) = \Theta(f(n))$.


**Transpose symmetry**

$f(n) = O(g(n))\quad$ if and only if $\quad g(n) = \Omega(f(n))$,

$f(n) = o(g(n))\quad$ if and only if $\quad g(n) = \omega(f(n))$.


Because these properties hold for asymptotic notations, we can draw an analogy between the asymptotic comparison of two functions $f$ and $g$ and the comparison of two real numbers $a$ and $b$:


$f(n) = O(g(n))\qquad$ is like $\qquad a\leq b$,

$f(n) = \Omega(g(n))\qquad$ is like $\qquad a\geq b$,

$f(n) = \Theta(g(n))\qquad$ is like $\qquad a = b$,

$f(n) = o(g(n))\qquad$ is like $\qquad a <  b$,

$f(n) = \omega(g(n))\qquad$ is like $\qquad a > b$,

## 2. Master Theorem

$$
T(n) = a \cdot T \left( \frac{n}{b} \right) + \Theta(n^c) \qquad \text{for }a \geq 1, b \geq 2, d, c \geq 0.
$$

**Case 1** $\quad c < \log_b a \quad T = \Theta(n^{\log_b a})$

**Case 2** $\quad c = \log_b a \quad T = \Theta(n^c \log_b a)$

**Case 3** $\quad c > \log_b a \quad T = \Theta(n^c)$


## 3. Recurrence Relations: Fibonacci Sequence

### 3.1. Recurrence relation

$$
F(n) =
\begin{cases}
1 & \text{if }0 < n \leq 2 \\
F(n-1) + F(n-2) & \text{otherwise}.
\end{cases}
$$

**Runtime equation**:

$$
T(n) =
\begin{cases}
0 & \text{if }n \leq 1\\
T(n-1) + T(n-2) + 1& \text{otherwise}.
\end{cases}
$$

Following is the Python code for the recursive version of computing the $n$-th Fibonacci number:

```python
def F(n):
  if n == 0:
    return 0
  elif n == 1:
    return 1
  else:
    return F(n-1) + F(n-2)
```

**Runtime** of the recursive Fibonacci is $O(2^{n/2})$.

### 3.2. Iterative Fibonacci

```python
def F(n):
  A = []
  A[0] = 0
  A[1] = 1
  for i in range(2,n+1):
    A[i] = A[i-1] + A[i-2]
  return A[n]
```

**Runtime** of the iterative Fibonacci is $O(n^2)$. Note that we do $O(n)$ additions on $O(n)$ bit integers.

### 3.3. Fibonacci using matrix multiplication

$$
\begin{bmatrix} F_1 \\\ F_2 \end{bmatrix}  = \begin{bmatrix} 0 & 1 \\\ 1 & 1  \end{bmatrix} \begin{bmatrix} F_0 \\\ F_1 \end{bmatrix}
$$

$$
\begin{bmatrix} F_n \\\ F_{n+1} \end{bmatrix}  = \begin{bmatrix} 0 & 1 \\\ 1 & 1  \end{bmatrix}^n \begin{bmatrix} F_0 \\\ F_1 \end{bmatrix}
$$

Since the number of multiplications is given by the recurrence $T(n) = T(n/2) +1$, using Master theorem, we find $T(n) = \log n$.

### 3.4. Closed form expression for $F_n$

$$
F_n = \frac{1}{\sqrt{5}} \left [ \left ( \frac{1 + \sqrt{5}}{2} \right)^n - \left ( \frac{1 - \sqrt{5}}{2} \right)^n \right ]
$$


## 4. Sorting and Searching

### 4.1. Insertion Sort

A good algorithm for sorting a small number of elements. It works the way you might sort a hand of playing cards:
- Start with an empty left hand and the cards face down on the table.
- Then remove one card at a time from the table, and insert it into the correct position in the left hand.
- To find the correct position for a card, compare it with each of the cards already in the hand, from right to left.
- At all times, the cards held in the left hand are sorted, and these cards were originally the top cards of the pile on the table.

```python
def insertionSort(A):
  for i in range(len(A)):
      j = i   # Insert i'th element in the correct place
      while (j != 0) and (A[j] < A[j-1]):
          A[j-1], A[j] = A[j], A[j-1]  # Swap A[j] and A[j-1]
          j -= 1
  return A
```

In the best case, the input list $A$ is already sorted, so the check $A[j] < A[j-1]$ in the `while` loop fails. Hence the best case runtime is the cost of the `for` loop, which is $O(n)$.

In the worst case, the input list $A$ is in reverse order, so we will go through the `while` loop every time, and the runtime is obviously $O(n^2)$.

**Runtime** $O(n^2)$.

**Example**

<p align="center">
<img width="600" alt="insertion_sort" src="https://github.com/user-attachments/assets/b786c1f5-3734-4369-ba36-0afadd8019eb" />
</p>

Note that $i$ indexes the "current card" being inserted into the hand. Elements to the left of $A[i]$ that are greater than $A[i]$ move one position to the right, and $A[i]$ moves into the evacuated position. The heavy vertical lines separate the part of the array in which an iteration works - $A[1:i]$ - from the part of the array that is unaffected by this iteration - $A[i + 1:n]$. The last part of the figure shows the final sorted array.

> **Insertion Sort Visualizer**: A nice graphical visualizer of insertion sort can be found [here](https://opendsa-server.cs.vt.edu/OpenDSA/AV/Sorting/insertionsortAV.html) and [here](https://www.hackerearth.com/practice/algorithms/sorting/insertion-sort/visualize/).

### 4.2. Merge Sort

The insertion sort is **incremental**: having sorted the first $i-1$ elements, we place $A[i]$ correctly, so that $A[0:i]$ is sorted.

Another common sorting approach is to use **divide and conquer**: 
  - **Divide** the problem into a number of subproblems that are smaller instances of the same problem.
  - **Conquer** the subproblems by solving them recursively.
    - ***Base case***: If the sub-problems are small enough, just solve them by brute force.
  - **Combine** the subproblem solutions to give a solution to the original problem.

Merge Sort is a sorting algorithm based on divide and conquer. Its worst-case running time has a lower order of growth than insertion sort.

We first define the function `merge()`, which takes two unsorted lists and outputs a single sorted list. 

```python
def merge(left, right):
  result = []
  i = j = 0

  while i < len(left) and j < len(right):
      if left[i] < right[j]:
          result.append(left[i])
          i += 1
      else:
          result.append(right[j])
          j += 1

  result.extend(left[i:])
  result.extend(right[j:])

  return result
```

The function `mergeSort()` uses the above `merge()` to recursively merge two sorted lists:

```python
def mergeSort(A):
  if len(A) <= 1:
    return A

  middle = len(A) // 2
  leftHalf = A[:middle]
  rightHalf = A[middle:]

  sortedLeft = mergeSort(leftHalf)
  sortedRight = mergeSort(rightHalf)

  return merge(sortedLeft, sortedRight)
```

**Recurrence relation**: $T(n) \leq 2T(n/2) + n - 1$. This is because each call of `mergeSort()` in turn makes two recursive calls to `mergeSort()` and performs a linear time merge.

**Runtime**: From the Master theorem, we find $T(n) = \Theta(n \log_2 n)$.

**Example** The following example illustrates how the above merge sort algorithm sorts the initially unordered sequence $A = [5, 2, 4, 7, 1, 3, 2, 6]$.

<p align="center">
<img width="400" alt="merge_sort" src="https://github.com/user-attachments/assets/1216e2af-dba5-4cb5-a86e-a79c75e2c86f" />
</p>

> **Merge Sort Visualizer**: A nice graphical visualizer of merge sort can be found [here](https://opendsa-server.cs.vt.edu/embed/mergesortAV).

### 4.3 Binary Search

```python
def binarySearch(array, val):
  l = 0                    # Right index = 0
  r = len(array)           # Left index = length of array
  while l < r:
    m = l + (r - l) // 2   # Middle index
    if array[m] == val:
      return m
    if array[m] > val:
      l = m
    else:
      r = m + 1
  return -1                # Not found
```
Let $T(n)$ be the number of comparisons needed to search an element in an array of $n$ elements. 

**Recurrence relation**: $T(n) = T(n/2) + c$.

**Runtime**: $O(\log_2 n)$.

## 5. My Solutions to Selected CLRS Exercises and Other Problems

Chapter 3 of CLRS contains many beautiful problems on running times. [My solutions to a number of selected problems from CLRS (3rd Ed) and other miscellaneous problems can be found here.](./fundamentals_problems.md)

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)

