# Fundamentals

## 1. Asymptotic Notation

<img width="856" alt="asymptotic" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/cb2a42a0-56f8-4d5c-ac7e-4f37d72f9967">


### 1.1. $\Theta$-notation

The $\Theta$-notation asymptotically bounds a function from above and below.

$\Theta(g(n)) = \\{f(n):$ there exist positive constants $c_1, c_2$ and $n_0$ such that $0 \leq c_1g(n) \leq f(n) \leq c_2g(n)$ for all $n \geq n_0 \\}$.

### 1.2. $O$-notation

When we have only an **asymptotic upper bound**, we use $O$-notation.

$O(g(n)) = \\{f(n):$ there exist positive constants $c$ and $n_0$ such that $0  \leq f(n) \leq cg(n)$ for all $n \geq n_0 \\}$.


### 1.3. $\Omega$-notation

$\Omega$-notation provides an **asymptotic lower bound**.

$\Omega(g(n)) = \\{f(n):$ there exist positive constants $c$ and $n_0$ such that $0  \leq  cg(n) \leq f(n)$ for all $n \geq n_0 \\}$.


**Theorem**: For any two functions $f(n)$ and $g(n)$, we have $f(n) = \Theta(g(n))$ if and only if $f(n) = O(g(n))$ and $f(n) = \Omega(g(n))$.


### 1.4. $o$-notation

$o(g(n)) = \\{f(n):$ for any positive constant $c > 0$, there exists a constant $n_0 > 0$ such that $0  \leq f(n) < cg(n)$ for all $n \geq n_0 \\}$.

Example: $5n = o(n^2)$, but $5n^2 \neq o(n^2)$.

If $f(n) = o(g(n))$, then

$$
\lim_{n \rightarrow \infty} \frac{f(n)}{g(n)} = 0.
$$


### 1.5. $\omega$-notation

$\omega(g(n)) = \\{f(n):$ for any positive constant $c > 0$, there exists a constant $n_0 > 0$ such that $0  \leq  cg(n) < f(n)$ for all $n \geq n_0 \\}$.

Example: $n^2/3 = \omega(n)$, but $n^2/3 \neq \omega(n^2)$.

If $f(n) = \omega(g(n))$, then

$$
\lim_{n \rightarrow \infty} \frac{f(n)}{g(n)} = \infty.
$$

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

```
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

```
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

### 4.1. Merge Sort

We first define the function *merge()*, which takes two unsorted lists and outputs a single sorted list. 

```
def merge(s,t)
  if not s: return t
  if not t: return s
  if s[0] <= t[0]:
    u = pop(s)
  else:
    u = pop(t)
  return u 
```

The function *mergeSort()* uses the above *merge()* to recursively merge two sorted lists:

```
def mergeSort(s):
  if len(s) == 1: return s
  split(s, s1, s2)
  s1 = mergeSort(s1)
  s2 = mergeSort(s2)
  return merge(s1,s2)
```
**Recurrence relation**: $T(n) \leq 2T(n/2) + n - 1$. This is because each call of *mergeSort()* in turn makes two recursive calls to *mergeSort()* and performs a linear time merge.

**Runtime**: From the Master theorem, we find $T(n) = \Theta(n \log n)$.

### 4.2. Insertion Sort

```
def insertionSort(x): # S is a list
  n = len(S)
  for i in range(n-1):
    j = i
    while j > 0 and S[j+1] < S[j]:
      S[j], S[j+1] = S[j+1], S[j] # swap
      j = j-1
  return S
```
**Runtime** $O(n^2)$.

### 4.3 Binary Search

```
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

[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
