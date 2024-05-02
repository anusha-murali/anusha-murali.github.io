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

Since $n$ is odd, $n-1$ is even. Therefore, we can represent $n-1$ as $n -1 = 2^i \cdot u$, where $u$ is odd. Suppose we choose a random base $a$ and compute $a^{n-1}$ by first computing $a^u \pmod{n}$ and then repeatedly squaring. Along the way, we will check to see for the values, $a^u, a^{2u}, a^{4u}, \ldots$ and verify whether they have the following property:

$$
a^{2^i u} ~~  \equiv ~~ 1 \pmod{n}.
$$

$$
a^{2^{i-1}u} ~~ \not \equiv ~~\pm 1 \pmod{n}
$$



If we see the above property, we have encountered a non-trivial square root of $1 \pmod{n}$. Rabin primality test, presented in Theorem 2 of Lecture 17, says that only composite numbers have non-trivial square roots of $1 \pmod{n}$. For a random $2 \leq a  <  n -1$ ($a$ is relatively prime to $n$), we check whether $a^u \equiv 1 \pmod{n}$ or $a^{2^j \cdot u} \equiv 1 \pmod{n}, 0 \leq j \leq i -1$. If we found an $a$ which doesn't satisfy these properties, then we have found a witness for the compositeness of $n$, so $n$ is not a prime number.

**Example 1**: Prove 63973 (a Carmichael number) is composite by finding a witness in the form of a non-trivial square root of 1.

Following is a description of how Rabin primality test finds the compositeness of the given $n$.

Let $n = 63973$. Hence $n-1 = 63972 = 2^2 \cdot 15993$. Let $a = 3$ (3 is relatively prime to $n$) and we run Rabin Testing for primality as follows:

1. $a^{2^2 \cdot 15993} = 1 \pmod{n}$
2. $a^{2^1 \cdot 15993} = 1 \pmod{n}$
3. $a^{15993} = 19683 \pmod{n}$


Since $a^{2^{i-1} \cdot u} \neq \pm 1 \pmod{n}$ and $a^{2^i \cdot u} = 1 \pmod{n}$, where $a = 3, i = 1, u = 15993$, we have found a non-trivial square root of 1 modulo $n$. In our case, the non-trivial square root of 1 modulo $n$ is $3^{15993} \pmod{63973} = 19683$. Therefore, 63973 is a composite number and $a = 3$ is the witness for the compositeness of $63973$.

**Example 2**: True or False? Let $n$ be an odd integer and write $n-1 = 2^t \cdot u$ with $u$ odd. Then, if for some $a$, $a^{2^i u} \equiv 1 \pmod{n}$, but $a^{2^{i+1}u} \not \equiv \pm 1 \pmod{n}$, then $n$ is composite.

**False.** It is the wrong direction for Rabin-Miller Testing. We should be checking for non-trivial square roots.

## 2. RSA Algorithm

Alice wants to securely send message to Bob, but Eve is listening.

<p align="center">
<img width="500" alt="26" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/66a1b2d1-133f-45ce-abd5-208813458952">
</p>

**Bob's pubic key**: $(n, e)$, $n=pq$, $p,q$ are large primes and $e$ is coprime to $\phi(n) = (p-1)(q-1)$,

**Bob's private key**: $d = e^{-1} \pmod{\phi(n)}$ ,

**Encryption**: $e(x) = x^e \pmod{n}$, 

**Decryption**:  $d(y) = y^d \pmod{n}$

**Note** $d$ is the multiplicative inverse modulo of $e$ with respect to $\phi(n)$.

**Claim**: $d(e(x)) = x^{1+k(p-1)(q-1)} = x \pmod{n}$.

*Proof*: By Fermat's little theorem, ${(x^{k(p-1)})}^{q-1} \pmod{q} = 1$, and ${(x^{k(q-1)})}^{p-1} \pmod{p} = 1$, because $p$ and $q$ are primes. Therefore,

$$
x^{1+k(p-1)(q-1)} \pmod{pq} = x \cdot x^{k(p-1)(q-1)} \pmod{pq} = x \pmod{pq}.
$$

**Example 1**:
- Choose $p=3$ and $q=11$, so $n = pq = 33$
- Compute $\phi(n) = (p-1)(q-1) = 20$
- Choose the encryption key $e$ such that $1 < e < \phi(n)$ and $e$ and $\phi(n)$ are coprime. Let $e = 7$.
- Compute the decryption key, $d$, which is the multiplicative inverse of $e \pmod{\phi(n)}$. We use **Extended Euclidean algorithm** to find the multiplicative inverse. Hence $d = 3$.
- Public key is $(e, n) = (7, 33)$.
- Private key is $(d, n) = (3, 33)$.

Let us say that Alice wants to send message $m = 2$ to Bob. She uses Bob's public key, $(e, n) = (7, 33)$ to encrypt the message as $m^e \pmod{n} = 2^7 \pmod{33} = 29$, and sends 29 to Bob.

Bob decrypts the encrypted message using his private key, $(d, n) = (3, 33)$ and obtains $m = 29^3 \pmod{33} = 2$.

**Example 2**
- Choose $p=11, q=29$, and $e = 3$. So $n = pq = 319$.
- Compute $\phi(n) = (p-1)(q-1) = 280$
- Compute the decryption key, $d$, which is the multiplicative inverse of $e \pmod{\phi(n)}$. We use **Extended Euclidean algorithm** to find the multiplicative inverse. Hence $d = 187$.
- Public key is $(e, n) = (3, 319)$.
- Private key is $(d, n) = (187, 319)$.

Let us say that Alice wants to send message $m = 100$ to Bob. She uses Bob's public key, $(e, n) = (3, 319)$ to encrypt the message as $m^e \pmod{n} = 100^3 \pmod{319} = 254$, and sends 254 to Bob.

Bob decrypts the encrypted message using his private key, $(d, n) = (187, 319)$ and obtains $m = 254^{187} \pmod{319} = 100$.

### 2.1. Euclid's GCD Algorithm and Extended Euclid's Algorithm

One way of computing the gcd is to factor the two numbers, and find the common prime factors. Factoring, however, is a problem for which we do not have general efficient algorithms. The following Euclid's algorithm avoids factoring. Assume $a,b \geq 0$.

```
function Euclid(a, b)
if b = 0 return(a)
return (Euclid(b, a mod b))
```

Euclid’s algorithm can be extended to give not just the GCD $d = gcd(a, b)$, but also two integers $x$ and $y$ such that $ax + by = d$. 

```
Extended-Euclid(a, b) 
if b = 0 return(a, 1, 0)
Compute k such that a = bk + (a mod b)
(d, x, y) = Extended-Euclid(b, a mod b)
return((d, y, x − ky))
```


### 2.2. Finding Multiplicative Modulo Inverse of a Number

The decryption key in the RSA algorithm uses the multiplicative inverse  of $e$ with respect to $\phi(n) = (p-1)(q-1)$. Therefore, it is imporant to learn how to compute a multiplicative inverse.

It can be easily computed using the Extended Euclidean Algorithm. We show the process with an example.

**Example 1** Find the multiplicative inverse of 7 with respect to 31.

We are asked to find $y$ where $31x + 7y = 1$. We run the Extended Euclidean Algorithm as shown in the table below:

We fill-up the $a, b, q$ columns of the table top-down, then find $d = 1$, and then fill-up the $x$ and $y$ columns bottom-up from the base case as shown below.

<p align="center">
<img width="200" alt="27" src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/f7e25590-38dc-4cdc-8895-911976fa206f">
</p>

Reading off the $x$ and $y$ values from the top row, we find $x=-2$ and $y= 9$. We confirm that $37(-2) + 7(9) = 1$, and therefore the multiplicative inverse of 7 with respect to 31 is 9.

[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
