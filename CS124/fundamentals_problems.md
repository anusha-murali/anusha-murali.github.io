<img width="1375" alt="favorite_fundamentals" src="https://github.com/user-attachments/assets/894cbd0a-270b-4fbc-b551-cf0bc43b5697" />


1. Make all true statements of the form $f_i \in o(f_j)$, $f_i \in O(f_j)$, $f_i \in \omega(f_j)$, and $f_i \in \Omega(f_j)$ that hold for $i \le j$, where $i, j \in \{1,2,3,4,5\}$ for the following functions. No proof is necessary. All logs are base 2 unless otherwise specified.
   - $f_1 = (\log n)^{\log n}$
   - $f_2 = 2^{\sqrt{\log n}}$
   - $f_3 = 2^{2^{\sqrt[3]{\log\log\log n}}}$
   - $f_4 = n^{\log\log n}$
   - $f_5 = (\log\log n)^n$

   $$
1 + 2 + 2^2 + 2^h = 2^{h+1} -1.
   $$
\begin{tabular}{|c|c|c|c|c|c|}\hline
 	& $f_1$ & $f_2$ & $f_3$ & $f_4$ & $f_5$ \\ \hline
 $f_1$ & $O, \Omega$ & $\Omega, \omega$ & $\Omega, \omega$ & $O, \Omega$ & $O, o$ \\ \hline
 $f_2$ & $O, o$ & $O, \Omega$ & $\Omega, \omega $ & $O, o$ & $O, o$ \\ \hline
 $f_3$ & $O, o$ & $O, o$ & $O, \Omega$ & $O, o$ & $O, o$ \\ \hline
 $f_4$ & $O, \Omega$ & $\Omega, \omega$ & $\Omega, \omega$ & $O, \Omega$ & $O, o$ \\ \hline
 $f_5$ & $\Omega, \omega$ & $\Omega, \omega$ & $\Omega, \omega$ & $\Omega, \omega$ & $O, \Omega$ \\ \hline
\end{tabular}
$$

   And the minimum number occurs when the bottom row has only 1 element, and is $2^h - 1 + 1 = 2^h$.

   
3. asdf

   asdfasd

[Back to Fundamentals](./fundamentals.md)

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
