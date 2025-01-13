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

On the other hand, let us say that we are looking for $y_2$ in $A$, where $h_1(y_2) = 5, h_2(y_2) = 7$ and $h_3(y_2) = 10.$ We find that $A[h_1(y_2)] = A[5] = 1, A[h_2(y_2) = A[7] = 1, A[h_3(y_2)] = A[10] = 1$. Therefore, we conclude that element $y_2$ **may** be present in $A$.

## 2. False Positives

The probability of false positive is the probability that all hash functions return 1.

With $m$ bins and $kn$ balls analogy, the probability of false positive is,

$$
P \approx (1-e^{-kn/m})^k
$$

## 3. Optimal $k$

Differentiating $P$ with respect to $k$, we find the optimal value for $k$ as $k \approx \frac{m}{n} \ln 2$.


# Counting Bloom Filters

Counting Bloom filters are Bloom filters that support deletions.

1. Each entry in a Counting Bloom filter is a small counter (instead of a single bit).
2. When an item is inserted into the set, we increment the corresponding counters by 1.
3. When an item is deleted from the set, we decrement the corresponding counters by 1
4. The counter size must be large enough to avoid overflow. Typically 4 bit counters are sufficient.

## 1. Counter Overflow Probability

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

# Fingerprinting by Modular Arithmetic

**Problem**: We want to find a pattern string $P$ in a long document $D$. How can we do it quickly and efficiently?

In other words, we want to find all occurrences of pattern $P$ in $D$, i.e: the set of all indices $i$ such that $D_i = (d_i, \ldots, d_{i+k-1}) = P$, where $k = \|P\|$.

The idea of pattern matching using fingerprinting is to pick an appropriately large prime number $q$, so that $H(P) = P \pmod{q}$.

Naively computing $H(D_i)$ from scratch each time to check a document of length $n$ takes $O(nk)$ time.

So, we use the simple identity: $D_i = 10D_{i+1} + d_i - 10^k \cdot d_{i+k}$. Applying the hash function, we find,

$$
H(D_i) = D_i \pmod{q} = (10D_{i+1} + d_i - 10^k \cdot d_{i+k}) \pmod{q},
$$

so $H(D_i)$ can be computed from $H(D_{i+1})$ in $O(1)$ time.

# Set Resemblance

**Problem**: We want to detect near duplicate documents. How can we do it without doing an $O(n^2)$ comparisons?

The resemblance (or Jaccard coefficient) of two sets $A$ and $B$ is defined as

$$
R(A, B) = \frac{|A \cap B|}{|A \cup B|}.
$$

Suppose that we do not need to exactly compute the resemblance $R(A,B)$. We can obtain a reasonable approximation to $R(A,B)$ using randomization, specifically using hash functions.

## 1. MinHash

1. Pick a random permutation of the rows (the universe $U$)
2. Define a hash function for set $S$. For example, $h(S)$ = the index of the first row (in the permuted order), in which colum $S$ has 1.
4. Use $k$ (e.g., $k = 100$) independent random permutations to create a signature.

For example, let $U= \\{A, B, C, D, E, F\\}$ and $S_1 = \\{A, B, E\\},$ $S_2 = \\{C\\},$ $S_3 = \\{B, C, D, F\\},$ $S_4 = \\{A, D, F\\}.$ Following are the characteristic matrix representations of these sets for two different permutations $\pi_1$ and $\pi_2$ of $U$.

<p align="center">
<img width="480" alt="15" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/f579559e-b759-4319-9996-21f9fd9776cc">
</p>

The MinHash values for the left permutation $(\pi_1)$ is as follows:

$$
\text{MinHash}(\pi_1(S_1)) = 1, \quad \text{MinHash}(\pi_1(S_2)) = 3, \quad \text{MinHash}(\pi_1(S_3)) = 2, \quad \text{MinHash}(\pi_1(S_4)) = 1.
$$

The MinHash values for the right permutation $(\pi_2)$ is as follows:

$$
\text{MinHash}(\pi_2(S_1)) = 1, \quad \text{MinHash}(\pi_2(S_2)) = 6, \quad \text{MinHash}(\pi_2(S_3)) = 1, \quad \text{MinHash}(\pi_2(S_4)) = 3.
$$

**Lemma 1** Let $\pi(A)$ and $\pi(B)$ be some random permutations of the $n!$ possible permutations of the set $S$. Then $\min(\pi(A)) = \min(\pi(B))$ if and only if there exists $x \in A \cup B$ such that:
1. $x \in A \cap B$
2. $\pi(x) = \min(\pi(A)) = \min(\pi(B))$.

**Lemma 2** If $\pi$ is a random permutation, then for any $x, y \in A \cup B$,

$$
{\bf Pr}[\pi(x) = \min(\pi(A \cup B))] = {\bf Pr}[\pi(y) = \min(\pi(A \cup B))].
$$

**Example 1**: Let the universe be $U = \\{A, B, C\\}$ and some two arbitrary subsets be $S_1 = \\{B\\}$ and $S_2 = \\{A, B\\}$. Compute the similarity between $S_1$ and $S_2$ **directly using set resemblance** and **using MinHash** considering **all** possible permutations in $U$.

The set resemblance (or Jaccard coefficient) of $S_1$ and $S_2$ is $R(S_1, S_2) = \dfrac{\|S_1 \cap S_2\|}{\|S_1 \cup S_2\|} = \dfrac{1}{2}$.

There are 6 permuations of the universe $U$, namely $\\{A, B, C\\}$, $\\{A, C, B\\}$, $\\{B, A, C \\}$, $\\{B, C, A\\},$ $\\{C, A, B\\},$  and $\\{C, B, A\\}$. Computing the MinHash values of each of these 6 permutations, we obtain the following:

<p align="center">
<img width="600" alt="14" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/4e557587-6ba2-45d5-a883-f4c02c2290ed">
</p>

We note that 3 out of the 6 permuations have matching MinHash values, which is equal to the actual set resemblance of $\frac{1}{2}$. 

In fact, we have the following MinHash property:

$$
{\bf Pr}(\text{MinHash}(S_1) = \text{MinHash}(S_2)) = \dfrac{|S_1 \cap S_2|}{|S_1 \cup S_2|} =  R(S_1, S_2),
$$

where the probability is taken over all choices of permutations.

**Why?**

1. The first row where one of the two sets has value 1 belongs to the union. Recall that union contains rows with at least one 1.
2. We have equality if both sets have value 1, and this row belongs to the intersection.

In practice, documents contain thousands or hundreds of thousands of words, so we can just randomly select a few permutations and compute MinHash on them to determine the approximate set resemblance.

**Lemma 3**: ${\bf Pr}(\text{MinHash}(S_1) = \text{MinHash}(S_2))  =  R(S_1, S_2)$

*Proof*: There are three types of rows in the characteristic matrix:
1. Type $X$: There are $x$ rows with 1 in both columns
2. Type $Y$: There are $y$ rows with 1 in one column and 0 in the other
3. Type $Z$: There are $z$ rows 0 in both columns.

The total number of rows is $x+y+z$. The set resemblance is precisely $R(S_1, S_2) = \dfrac{\|S_1 \cap S_2\|}{\|S_1 \cup S_2\|} = \dfrac{x}{x+y}.$

Let row $r$ be the $\min\\{\text{MinHash}(S_1), \text{MinHash}(S_2)\\}$. It is either Type $X$ or Type $Y$, and it is Type $X$ with probability exactly $\dfrac{x}{x+y}$, since the permutation is random. This is the only case that $\text{MinHash}(S_1) = \text{MinHash}(S_2)$, otherwise $S_1$ or $S_2$ has 1, but not both. 


## 2. Shingling 

How do we turn document similarity into a set resemblance problem? The key idea is to hash pieces of the document– say every four consecutive words - into say, 64 bit numbers. This process is called shingling, and each set of consecutive words is called a shingle. Using hashing, the shingles give rise to the resulting numbers for the set resemblance problem.

## 3. MinHash based sketch

Once we have the shingles for the document, we associate to each document a sketch. If $N$ random permutations are taken in the definition of MinHash, then the sketch of a document $S$ is a list of $N$ numbers:

$$
(\min(\pi_1(S)), \min(\pi_2(S)),\ldots, \min(\pi_N(S))).
$$

Now we choose a threshold -  for example, if $N = 100$ we might say that two documents are similar if 90 out of the 100 entries in the sketch match.


## 4. Problems

**Problem 1**:  Let $A, B\subset\\{1,\ldots,N\\}$. In class we saw how to estimate the resemblance $R(A,B) = \|A\cap B\| / \|A\cup B\|$ by sampling random permutations $\pi_1,\ldots,\pi_n$ of $\{1,\ldots,N\}$ and computing the fraction of these for which $\min(\pi(A)) = \min(\pi(B))$. 

True or false: the algorithm would still work if instead of random permutations, we took $\pi_1,\ldots,\pi_n$ to be random *cyclic* permutations (that is, to sample each $\pi_i$, sample a random number $y$ from $\{0,\ldots,N-1\}$ and take $\pi_i$ to be the permutation which maps every element $x\in\{1,\ldots,N\}$ to $x + y \pmod{N}$). If the statement is true, provide a proof. Otherwise, you should specify (with proof) some choice of $A, B, N$ such that for a uniformly random *cyclic* permutation, $R(A,B)$ does not equal the probability that $\min(\pi(A)) = \min(\pi(B))$.

The claim is false. We will prove this with the following counter example.
    
Let us consider the two sets $A, B \subset \\{1, 2, 3\\}$, where $N = 3$,  $A = \\{2 \\}$ and $B = \\{1, 2 \\}$. The set resemblance (or Jaccard coefficient) is,

$$
R(A, B) = \frac{|A \cap B|}{|A \cup B|} = \frac{1}{2}.
$$

Since there are 3 elements in our example, namely 1, 2, and 3, using a cyclic permutation, we can permute the rows in only three ways. 

<p align="center">
<img width="480" alt="16" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/a18d448d-70e6-408e-a9e6-8e0698609047">
</p>

For the permutation $\pi_1$, the MinHash values are as follows:

$$
\text{MinHash}(\pi_1(A)) = 2, \quad \neq \quad \text{MinHash} (\pi_1(B)) = 1
$$


For the permutation $\pi_2$, the MinHash values are as follows:

$$
\text{MinHash}(\pi_2(A)) = 1, \quad =  \quad \text{MinHash} (\pi_2(B)) = 1
$$

For the permutation $\pi_3$, the MinHash values are as follows:

$$
\text{MinHash}(\pi_3(A)) = 3, \quad \neq \quad \text{MinHash} (\pi_3(B)) = 2
$$

Hence, out of the three possible cyclic permutations, each corresponding to modulo 3,  MinHash match occurs only on one of them.  Hence the average MinHash match for the above cyclic permutations, which is equal to the probability that $\text{MinHash}(\pi_1(A))  = \text{MinHash}(\pi_1(B))$  is $\dfrac{1}{3}$, while the actual set resemblance is $\dfrac{1}{2}$. Therefore, the algorithm will not work if we use random cyclic permutations.

**Problem 2**: Recall that *resemblance* $R(A, B)$ of two sets $A$ and $B$ is defined as $R(A, B) = \dfrac{\|A \cap B\|}{\|A \cup B\|}$, and we proved in class that if $A, B \subseteq \[N\]$ and we choose a uniformly random permutation $\pi: \[N\] \rightarrow \[N\]$, the probability that $\min(\\{\pi(a): a \in A \\}) = \min(\\{\pi(b): a \in B \\})$ is $R(A, B)$.

(a) What is the resemblance of the sets $A = \{1, 2, 4\}$ and $B = \{1, 2, 3\}$? (Here $N = 4$).

$$
R(A, B) = \frac{|A \cap B|}{|A \cup B|} = \frac{1}{2}.
$$

(b) Suppose we restrict our choice of permutations to *derangements*, that is, permutations $\pi$ such that for all $x$, $\pi(x) \neq x$. What's the probability that if we choose a uniformly random derangement, then $\min(\\{\pi(a): a \in A \\}) = \min(\\{\pi(b): a \in B \\})$, if 
$A = \\{1, 2, 4\\}$ and $B = \\{1, 2, 3\\}$ and $N = 4$?

There are 9 derangements of (1, 2, 3, 4), namely (2,1,4,3), (2,3,4,1), (2,4,1,3), (3,1,4,2), (3,4,1,2),(3,4,2,1),(4,1,2,3),(4,3,1,2),and(4,3,2,1). The characteristic matrices for all 9 of them are shown below:

<p align="center">
<img width="450" alt="25" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/679aaebe-a842-43a8-8eb3-2a2afed1864e">
</p>

As we can see only the first 3 have $\min(\\{\pi(a): a \in A \\}) = \min(\\{\pi(b): a \in B \\})$. So, the desired probability of the match is $\dfrac{1}{3}$.

**Problem 3**: Recall that *resemblance* $R(A, B)$ of two sets $A$ and $B$ is defined as $R(A, B) = \dfrac{\|A \cap B\|}{\|A \cup B\|}$.

Suppose that for some positive integer $N$, $A$ and $B$ are subsets of $\[N\]$ (i.e: $\{0, 1, \ldots, N-1\}$) with $\|A\| \geq 2$ and $\|B\| \geq 2$. Prove or disprove: For every such  $A$ and $B$, if we choose a uniformly random permutation $\pi: \[N\] \rightarrow \[N\]$, the probability that $\text{second-largest}(\{\pi(a):a \in A\})$ = $\text{second-largest}(\{\pi(b):b \in B\})$ is $R(A, B)$. Note that given a set $X$, $\text{second-largest}(X)$ is the second-largest element of $X$.

[Table of Contents](./index.md)
<!--
![111596338](https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002)
-->

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
