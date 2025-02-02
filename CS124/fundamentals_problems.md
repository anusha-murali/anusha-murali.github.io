<img width="1375" alt="favorite_fundamentals" src="https://github.com/user-attachments/assets/894cbd0a-270b-4fbc-b551-cf0bc43b5697" />


1. What are the minimum and maximum numbers of elements in a heap of height $h$?
   The maximum number of elements is when the bottom row is full, which is,

   $$
1 + 2 + 2^2 + 2^h = 2^{h+1} -1.
   $$

   And the minimum number occurs when the bottom row has only 1 element, and is $2^h - 1 + 1 = 2^h$.

   
2. Show that an $n$-element heap has height $\lfloor \log n \rfloor$.

   From the previous problem, we find $2^h \leq n \leq 2^{h+1} - 1 < 2^{h+1}$. Hence $h \leq \log n < h + 1$. Since $h$ is an integer, we find $h = \lfloor \log n \rfloor$.
3. 

[Back to Fundamentals](./fundamentals.md)

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
