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

Since the number of ways to create a $2 \times n$ rectangular grid is $f(n)$, the number of ways to create a $2 \times (n-1)$ rectangular grid is $f(n-1)$. Therefore, Case I has $f(n-1)$ possible ways.

**Case II**

We can also create a $2 \times n$ rectangle grid from a $2 \times (n-2)$ rectangular grid by adding two dominos horizontally as shown:
<p align = "center">
<img width="260" alt="domino_2" src="https://github.com/user-attachments/assets/b54ef092-7bd9-4de1-8aa8-b219cb30b26a" />
</p>
Since the number of ways to create a $2 \times n$ rectangular grid is $f(n)$, the number of ways to create a $2 \times (n-2)$ rectangular grid is $f(n-2)$. Therefore, Case II has $f(n-2)$ possible ways.


**Case III**

<p align = "center">
<img width="230" alt="domino_3" src="https://github.com/user-attachments/assets/c77d43f9-2604-415b-be3f-379e098ea718" />
</p>

**Case IV**

<p align = "center">
<img width="230" alt="domino_4" src="https://github.com/user-attachments/assets/cf8c7d69-7935-4e2d-9ae8-d2d727d8e263" />
</p>


**Runtime**: The total number of additions and multiplications done by the two `for` loops result in a runtime of $O(n^2)$.

[Back to Dynamic Programming Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
