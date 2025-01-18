### Domino and Tromino Tiling

**Problem**: 


**Dynamic Programming Solution**

We want to find the number of ways to create a $2 \times n$ rectangular grid using the given dominos and trominos. Let $f(n)$ be the number of ways to create a $2 \times n$ rectangular grid.

We observe that we can create a $2 \times n$ rectangle from the following four distinct configurations:

**Case 1**

We can create a $2 \times n$ rectangle grid from a $2 \times (n-1)$ rectangular grid by adding a domino vertically as shown:
<p align = "center">
<img width="251" alt="domino_1" src="https://github.com/user-attachments/assets/5d93db9b-a5de-4487-b65e-57337626cb93" />
</p>

Since the number of ways to create a $2 \times n$ rectangular grid is $f(n)$, the number of ways to create a $2 \times (n-1)$ rectangular grid is $f(n-1)$. Therefore, Case 1 has $f(n-1)$ possible ways.

**Case 2**

We can also create a $2 \times n$ rectangle grid from a $2 \times (n-2)$ rectangular grid by adding two dominos horizontally as shown:
<p align = "center">
<img width="260" alt="domino_2" src="https://github.com/user-attachments/assets/b54ef092-7bd9-4de1-8aa8-b219cb30b26a" />
</p>
Since the number of ways to create a $2 \times n$ rectangular grid is $f(n)$, the number of ways to create a $2 \times (n-2)$ rectangular grid is $f(n-2)$. Therefore, Case 2 has $f(n-2)$ possible ways.

**Case 3**

Since we are also using *trominos*, in addition to dominos, we could see that one way to build a $2 \times n$ rectangular grid is to add a tromino to an existing grid, which has a $1 \times 1$ hole at the top right as shown in the following diagram. Let us call this grid with a $1 \times 1$ hole at the top right, type $P$ structure.

<p align = "center">
<img width="230" alt="domino_3" src="https://github.com/user-attachments/assets/c77d43f9-2604-415b-be3f-379e098ea718" />
</p>

Let $g(n)$ be the number of ways to create the structure, which has a $1\times 1$ hole at the top right and has a bottom length of $n$. We will find a recurrence expression to determine $g(n)$ below.

Therefore the number of ways to create the structure, which has a $1\times 1$ hole at the top right and has a bottom length of $n-1$ is $g(n-1)$.

**Case 4**

We could also build a $2 \times n$ rectangular grid by adding a tromino to an existing grid, which has a $1 \times 1$ hole at the bottom right as shown in the following diagram. Let us call this grid with a $1 \times 1$ hole at the bottom right type $Q$ structure.

<p align = "center">
<img width="230" alt="domino_4" src="https://github.com/user-attachments/assets/cf8c7d69-7935-4e2d-9ae8-d2d727d8e263" />
</p>

Let $h(n)$ be the number of ways to create the structure, which has a $1\times 1$ hole at the bottom right and has a top length of $n$. We will find a recurrence expression to determine $h(n)$ below.

Therefore the number of ways to create the structure, which has a $1\times 1$ hole at the bottom right and has a top length of $n-1$ is $h(n-1)$.

Adding all four cases together, we find the total number of ways to create a $2 \times n$ rectangular grid from dominos and trominos is,

$$
f(n) = f(n-1) + f(n-2) + g(n-1) + h(n-1).
$$

Now, let us determine $g(n)$ and $h(n)$.

**Recurrent expression for $g(n)$**

We note that the type $P$ structure from Case 3 above, shown in the right below, can be constructed in the following 2 ways:

**(A)** It can be constructed by adding a tromino to a $2 \times (n-3)$ rectangular grid as shown below.

<p align = "center">
<img width="500" alt="domino_5" src="https://github.com/user-attachments/assets/29194a65-c22e-48ae-8172-7ad39d7eec1d" />
</p>

Hence there are $f(n-2)$ possible ways to build a type $P$ structure with a bottom length of $n$, using the above construction.


**(B)** The type $P$ structure can also be constructed by adding a domino to a type $Q$ structure (similar to the one in Case 4 above) with a top length of $n-2$ as shown below.

<p align = "center">
<img width="500" alt="domino_6" src="https://github.com/user-attachments/assets/411c952c-4db9-4c50-b818-3c133b6d9d6a" />
</p>

In order to create a type $P$ structure with a bottom length of $n$, we need a type $Q$ structure with a top length of $n-1$. There are $h(n-1)$ possible ways to create a type $Q$ structure with a top length of $n-1$.

Combining the results from **(A)** and **(B)** above, we obtain the following recurrent equation for $g(n)$:

$$
g(n) = f(n-2) + h(n-1).
$$


**Recurrent expression for $h(n)$**

We note that the type $Q$ structure from Case 4, shown in the right below, can be constructed in the following 2 ways:

**(A)** It can be constructed by adding a tromino to a $2 \times (n-3)$ rectangular grid as shown below.

<p align = "center">
<img width="500" alt="domino_7" src="https://github.com/user-attachments/assets/35fc2aaa-5479-44cd-bf06-d0af98c2fc3e" />
</p>

Sine a rectangular grid of size $2 \times n$ can be created in $f(n)$ ways, there are $f(n-2)$ ways the structure 
$X$ with a top length of $n$ can be created.

**(B)** It can also be constructed by adding a domino to a type $P$ structure (similar to the one in Case 3 above) with a bottom length of $n-2$ as shown below.

<p align = "center">
<img width="500" alt="domino_8" src="https://github.com/user-attachments/assets/72c4ad02-c7ff-453f-958f-98849beb32d8" />
</p>

Sine the type $P$ structure  with a bottom length of $n$ can be created in $g(n)$ ways, there are $g(n-1)$ ways the type $Q$ structure with a top length of $n-1$ can be created.

Combining the results from **(A)** and **(B)** above, we obtain the following recurrent equation for $h(n)$:

$$
h(n) = f(n-2) + g(n-1).
$$


Having determined the recurrent equations for $g(n)$ and $h(n)$, we can now find $f(n)$, the total number of ways to create a rectangular grid of size $2 \times n$, using the following three recurrences:

$$
\begin{align*}
f(n) &= f(n-1) + f(n-2) + g(n-1) + h(n-1)\\
g(n) &= f(n-2) + h(n-1)\\
h(n) &= f(n-2) + g(n-1)
\end{align*}
$$


**Runtime**: The total number of additions and multiplications done by the two `for` loops result in a runtime of $O(n^2)$.

[Back to Dynamic Programming Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
