# Hashing

## 1. The Birthday Paradox

Assuming birthdays are distributed uniformly at random across the 365 days of the year, how many people do there need to be in a room before there is a > 50% chance that two of them have the same birthday?

The probability the first two people have different birthdays is $(1−\frac{1}{365})$. So, the probability that all of the first $k$ people have different birthdays is,

<!--
```math
\left(1 - \frac{1}{365} \right)\left(1 - \frac{2}{365} \right) \cdots  \left(1 - \frac{k-1}{365} \right)
```
-->

$$
\left(1 - \frac{1}{365} \right)\left(1 - \frac{2}{365} \right) \cdots  \left(1 - \frac{k-1}{365} \right)
$$

For $k=23$, this probability crosses over 49.3%. So, if there are at least 23 people in the room, the probability that two of them will have the same birthday is > 50%.

## 2. Balls into Bins

The birthday paradox is often formulated in terms of balls and bins. 

Consider $n$ balls that are randomly thrown into $m$ bins. 

### Collision Probability

The probability that all of the $n$ balls land in different bins, given that $n < m$ is,

$$
\left(1 - \frac{1}{m}\right) \left(1 - \frac{2}{m}\right) \cdots \left(1 - \frac{n-1}{m}\right) \leq \text{exp}\left ( -\frac{1}{m}\sum_{i=1}^{n-1}i \right) \leq \text{exp}(-\Omega(n^2/m))
$$

### Number of Empty Bins

For the first bin to be empty, it has to be missed by all $n$ balls. Since each ball hits the first bin with probability $\frac{1}{m}$, the probability that the first bin remains empty is,

$$
\left(1 - \frac{1}{m} \right)^n \approx e^{-n/m}.
$$

Since the same argument holds for all bins, on average an $e^{-n/m}$ fraction of the bins will remain empty.

## 3. Hash Functions

A hash function, $H(x)$ is a deterministic mapping from one set (balls) to another set (bins) that appears random across different elements of the first set (balls).

Let $A$ be an array of $m$ bits representing a set $S=\\{ x_1, x_2, \ldots, x_n \\}$ of $n$ elements. We will turn on the bit corresponding to the index returned by $h(x_i)$, indicating that the element $x_i$ is present in the set. Therefore, if $x_i \in S$, then $A[h(x_i)] = 1$.

False positives can occur. It is possible that for some $x_j \not \in S$, it may be that $A[h(x_j)] =1$.

False positive probability = $1 - e^{-n/m}$.

## 4. Hashing and Passwords

To protect against hackers, computer systems prefer that users don't use dictionary words as passwords. The probability of rejecting a password that should be accepted is the same as the probability that the first bin is not empty in the balls and bins analysis, which is $1-e^{-n/m}$. 

For example, with $n/m = 0.5$, this false positive probability is $\approx 0.4$, which is very high! So, we need $m$ to be very large or alternative solutions such as the following:

* Hashing with chaining
* Hashing with linear probing
* Bloom Filters


# Bloom Filters

1. A Bloom filter is an array $A$ of $m$ bits representing a set $S=\\{ x_1, x_2, \ldots, x_n \\}$ of $n$ elements. All entries in $A = 0$ initially.
2. $k$ independent hash functions, $h_1, h_2, \ldots, h_k$ with range $\\{1, 2, \ldots, m\\}$.
3. For eacch $x_i \in S$, the bit $h_j(x_i)$ in the array $A$ is set to 1, for $1 \leq j \leq k$.

## 1. An Example

Let $m = 10$ and $k = 3$, so there are 3 hash functions, $h_1, h_2$ and $h_3$. The entries in array $A$ are all initialized to 0 first.

$$
A = \begin{array}{|c|c|c|c|c|c|c|c|c|c|}
\hline
0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0 & 0\\
\hline
\end{array}
$$

Let $h_1(x_1) = 2, h_2(x_1) = 5$ and $h_3(x_1) = 7$.  After inserting $x_1$, array $A$ is as follows:

$$
A = \begin{array}{|c|c|c|c|c|c|c|c|c|c|}
\hline
0 & 1 & 0 & 0 & 1 & 0 & 1 & 0 & 0 & 0\\
\hline
\end{array}
$$

Let $h_1(x_2) = 5, h_2(x_2) = 7$ and $h_3(x_2) = 10$.  After inserting $x_2$ next, array $A$ is as follows:

$$
A = \begin{array}{|c|c|c|c|c|c|c|c|c|c|}
\hline
0 & 1 & 0 & 0 & 1 & 0 & 1 & 0 & 0 & 1\\
\hline
\end{array}
$$

Let us consider searching for the two elements $y_1$ and $y_2$ that are **not present** in $A$.

Let $h_1(y_1) = 2, h_2(y_1) = 4$ and $h_3(y_1) = 7$. We find that $A[h_1(y_1)] = A[2] = 1$ and $A[h_3(y_1)] = 1$. But $A[h_2(y_1)] = A[4] = 0$. Therefore, we conclude **with 100% certainty** that $y_1$ is not present in $A$.

On the other hand, let us say that we are looking for $y_2$ in $A$, where $h_1(y_2) = 5, h_2(y_2) = 7$ and $h_3(y_2) = 10$. We find that $A[h_1(y_2)] = A[5] = 1, A[h_2(y_2) = A[7] = 1, A[h_3(y_2)] = A[10] = 1$. Therefore, we conclude that element $y_2$ **may** be present in $A$.

## 2. False Positives

The probability of false positive is the probability that all hash functions return 1.

With $m$ bins and $kn$ balls analogy, the probability of false positive is,

$$
P \approx (1-e^{-kn/m})^k
$$

## 3. Optimal $k$

Differentiating $P$ with respect to $k$, we find the optimal value for $k$ as $k \approx \frac{m}{n} \ln 2$.


# 1. Counting Bloom Filters

Counting Bloom filters are Bloom filters that support deletions.

1. Each entry in a Counting Bloom filter is a small counter (instead of a single bit).
2. When an item is inserted into the set, we increment the corresponding counters by 1.
3. When an item is deleted from the set, we decrement the corresponding counters by 1
4. The counter size must be large enough to avoid overflow. Typically 4 bit counters are sufficient.

## Counter Overflow Probability

Consider a set of $n$ elements, $k$ hash functions and $m$ counters. Let $c(i)$ be the count for the $i$-th counter. Therefore,

$$
P[c(i) = j] = \dbinom{nk}{j} \left(\frac{1}{m}\right)^j \left(1-\frac{1}{m}\right)^{nk-j}
$$

Therefore,

$$
P[c(i) \geq j] \leq \dbinom{nk}{j}  \frac{1}{m^j} 
$$

A very loose upper bound can be given as,

$$
P[c(i) \geq j] \leq \left(\frac{enk}{jm}\right)^j
$$ 

This is with modernist WORKING with TOC hmin = 1 and hmax = 2!!!

# Fingerprinting

Problem: We want to find a paterrn string $P$ in a long document $D$. How can we do it quickly and efficiently?



[Table of Contents](./index.md)
<!--
![111596338](https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002)
-->

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
