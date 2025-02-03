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
             if A[j] > A[j+1]:
                swap A[j] and A[j+1]
    ```


      In this problem we will study the behavior of a twisted version of BubbleSort, described below.
   
      ```python
          def TwistedBubbleSort(A[0..n-1]):
             for i in range(len(A)):
                for j in range(len(A))):
                   if A[i] < A[j]:
                      swap A[i] and A[j]
      ```
      
      Your task is to prove that TwistedBubbleSort also correctly sorts every array. (While not necessary, you may assume for simplicity that the elements of $A$ are all distinct.)

    1. Explain in plain English why TwistedBubbleSort is different from BubbleSort.
      
       TwistedBubbleSort() compares $A[i]$ to $A[j]$ for *every* $i$ and $j$ and swaps them if $A[i] < A[j]$, while regular bubble sort only compares and swaps *adjacent elements* $A[j]$ and $A[j+1]$.

    2. Prove that after the $i$-th iteration of the outer loop, the largest element of $A$ is at the $i$-th index.
   
       During the $i$-th iteration of the loop, the elements at every index $j$ from $0 \ldots n-1$ are compared to $A[i]$ for $i$ ($i$ is constant for the duration of this iteration). If $A[j] > A[i]$, the elements at $i$ and $j$ get swapped. If $A[i]$ already holds the largest element, then no changes are made to the array, and at the end of the $i$-th iteration $A[i]$ continues to hold the largest element. Else, since we iterate through the entire array, there must exist some $A[j] > A[i]$ for some index $j$ that holds the largest element. These two elements must get swapped, after which $A[i]$ holds the largest element, following which there are no more swaps and this reverts to the first case, such that at
the end of the $i$-th iteration $A[i]$ then holds the largest element.
     
      3. Prove that after the $i$-th iteration of the outer loop, indices 0 to $i$ of the array are sorted.
   
         We shall prove this using induction.

         **Base case**: After the first iteration of the outer loop, the subarray of length one at index 0 is sorted.

         **Inductive hypothesis**: Suppose it is true for some $1 \leq i < n$ that after the $i$-th iteration of the outer loop, indices 0 to $i$ of the array are sorted.

         **Inductive step**: We can now show that after the next iteration of the outer loop, the $i + 1$th iteration, indices 0 to $i + 1$ of the array are sorted.
To do this, let’s prove that after the $j$-th iteration of the inner loop, the first $j$ elements are sorted.
Before the iteration, let’s split the current first $i$ elements into two parts, $A[0], \ldots, A[k]$, and $A[k + 1], \ldots, A[i]$, such that the first part has everything less than or equal to the value in $A[i + 1]$ and the second has everything greater. These two parts remain sorted in increasing order, as given by our inductive hypothesis. (Note that the first part can be of length 0 when $A[i +1]$ is the smallest element encountered so far.)
When the inner loop iterates through $A[0], \ldots, A[k]$, no swaps are made.
When the inner loop iterates through $A[k + 1], \ldots, A[i]$, it will always be true that the index currently being iterated on has an value greater than or equal to the value stored at $A[i +1]$ because $A[k + 1] \geq A[i]$. Because $A[k + 1], \ldots, A[i]$ are sorted, we will be swapping them into index $i + 1$ in increasing order and swapping them out only when a bigger element is encountered. This means everything that is at least as small as the current value of $A[i + 1]$ has already been iterated upon, and $A[i +1]$ is inserted after them. By the time we get to the iteration to swap $A[i]$ and $A[i + 1]$, we move the largest element of $A$ to $A[i + 1]$, and the final swap makes the first $A[i + 1]$ elements corrected sorted.
No more swaps will be performed in this iteration of the outer loop since the largest element is already $A[i + 1]$.

         **Conclusion**: By the principle of mathematical induction, it is true for all $1 \leq i \leq n$ that after the $i$-th iteration of the outer loop, indices 0 to $i$ of the array are sorted.


14. You can also think of insertion sort as a recursive algorithm. In order to sort $A[1:n]$, recursively sort the subarray $A[1:n-1]$ and then insert $A[n]$ into the sorted subarray $A[1:n-1]$. Write pseudocode for this recursive version of insertion sort. Give a recurrence for its worst-case running time.

    Following is the pseudocode for the recursive version of the insertion sort:

    ```python
    def recursiveInsertionSort(A, n):
       if n > 1:
          recursiveInsertionSort(A, n-1):
          key = A[n]
          j = n - 1
          while j > 0 and A[j] > key:
             A[j+1] = A[j]
             j = j -1
          A[j+1] = key
    ```
    It takes $\Theta(n)$ time in the worst case to insert $A[n]$ into the sorted array, $A[1:n-1]$. Therefore, our recurrence is as follows:

    $$
      T(n) = \begin{cases}
             \Theta(1) & \text{if }n=1,\\
             T(n-1) + \Theta(n) & \text{if }n> 1.
             \end{cases}
    $$
    
    The solution to the above recurrence is $T(n) = \Theta(n^2)$.
16. Describe an algorithm that, given a set $S$ of $n$ integers and another integer $x$, determines whether $S$ contains two elements that sum to exactly $x$. Your algorithm should take $\Theta(n \log n)$ time in the worst case.

    Given that $S$ is a set, if  $x/2 \in S$, then it cannot appear twice. Therefore $x/2$ cannot be a solution and can be removed from $S$. We first sort the elements in $S$, which takes $\Theta(n \log n)$ time. For each element $y \in S$, we do a binary search fo $x-y$ in $S$, which takes $\Theta(\log n)$ time in the worst case. Since there are at most $n$ of $y$, the worst-case runtime for all the binary searches is $\Theta (n \log n)$. Hence the running time of our algorithm is $\Theta (n \log n)$.
    
18. Consider the searching problem:

    **Input**: A sequence of $n$ numbers $(a_1, a_2, \ldots, a_n)$ stored in array $A[1:n]$ and a value $x$.
    **Output**: An index $i$ such that $x$ equals $A[i]$ or the special value `NIL` if $x$ does not appear in $A$.

    Write pseudocode for **linear search**, which scans through the array from beginning to end, looking for $x$. Using a loop invariant, prove that your algorithm is correct. Make sure that your loop invariant fulfills the three necessary properties.

    ```python
    def linearSearch(A, n, x):
       i = 1
       while i <= n and A[i] != x:
          i = i + 1
       if i > n:
          return NIL
       else:
          return i
    ```
    The above function checks each array element until either $i> n$ or $x$ is found.

    **Loop invariant**: At the start of each iteration of the `while` loop, the value $x$ does not appear in the subarray $A[1:i-1]$.

    **Initialization**: Upon entering the first iteration, $i=1$. The subarray $A[1:i-1]$ is empty, and the loop invariant is trivially true.

    **Maintenance**: At the start of an iteration for index $i$, the loop invariant says that $x$ does not appear in the subarray $A[1:i-1]$. If $i \leq n$, then either $A[i] =x$ or $A[i] \neq x$. In the former case, the test in the `while` loop header comes up `FALSE`, and there is no iteration for $i+1$. In the latter case, the test comes  up `TRUE`. Since $A[i] \neq x$ and $x$ does not appear in $A[1:i-1]$, we have that $x$ does not appear in $A[1:i]$. Incrementing $i$ for the next iteration preserves the loop invariant. If $i>n$, then the test in the `while` loop header comes up `FALSE`, and there is no iteration for $i+1$.

    **Termination**: The `while` loop terminates for one of two reasons. If it terminated because $i > n$, then $i = n+1$ at that time. By the loop invariant, the value $x$ does not appear in the subarray $A[1:i-1]$, which is the entire array $A[1:n]$. The function correctly returns `NIL` in this casee. If the loop terminated because $i \leq n$ and $A[i] =x$, then the function correctly returns the index $i$.
    
20. In the previous problem, observe that if the subarray being searched is already sorted, the searching algorithm can check the midpoint of the subarray against $x$ and eliminate half of the subarray from further consideration. The **binary search** algorithm repeats this procedure, halving the size of the remaining portion of the subarray each time. Write pseudocode for both iterative and recursive binary search. Argue the worst-case running time of binary search is $\Theta(\log n)$.

    Both the iterative version and the recursive version of the binary-search take a sorted array $A$, a value $x$, and a range [*low:high*] of the array, in which we search for the value $x$. The function compares $x$ to the array element at the midpoint of the range and decides to eliminate half the range from further consideration.

    ```python
       def iterativeBinarySearch(A, x, low, high):
          while low <= high:
             mid = floor((low+high)/2)
             if x == A[mid]:
                retun mid
             elsif x > A[mid]:
                low = mid + 1
             else:
                high = mid - 1
          return NIL
    ```

    ```python
       def recursiveBinarySearch(A, x, low, high):
          if low > high:
             return NIL
          mid = floor((low+high)/2)
          if x == A[mid]:
             return mid
          elsif x > A[mid]:
             return recursiveBinarySearch(A, x, mid + 1, high)
          else:
             return recursiveBinarySearch(A, x, low, mid - 1)
    ```
    Both functions terminate the search unsuccessfully when the range is empty (i.e., low > high) and terminate it successfully if the value $x$ has been found. Based on the comparison of $x$ to the middle element in the searched range, the search continues with the range halved. The recurrence for these functions is therefore $T(n) = T(n/2) + \Theta(1)$, whose solution is $T(n) = \Theta(\lg n)$, where $\lg$ is base-2.
    
22. Although merge sort runs in $\Theta (n \lg n)$ worst-case time and insertion sort runs in $\Theta(n^2)$ worst-case time, the constant factors in insertion sort can make it faster in practice for small problem sizes on many machines. Thus, it makes sense to coarsen the leaves of the recursion by using insertion sort within merge sort when subproblems become sufficiently small. Consider a modification to merge sort in which $n/k$ sublists of length $k$ are sorted using insertion sort and then merged using the standard merging mechanism, where $k$ is a value to be determined.

    1. Show that insertion sort can sort the $n/k$ sublists, each of length $k$, in $\Theta(n k)$ worst-case time.
       
       Insertion sort takes $\Theta(k^2)$ time per $k$-element list in the worst case. Therefore, sorting $n/k$ lists of $k$ elements takes $\Theta(k^2 n/k) = \Theta(nk)$ worst-case time.
       
    3. Show how to merge the sublists in $\Theta(n \lg (n/k))$ worst-case time.
   
       Just extending the 2-list merge to merge all the lists at once would take $\Theta(n \cdot n/k) = \Theta(n^2/k)$ time ($n$ from copying each element once into the result list, $n/k$ from examining $n/k$  lists at each step to select next item for result list).
       
      To achieve $\Theta(n \lg(n/k))$-time merging, merge the lists pairwise, then merge the resulting lists pairwise, and so on, until there’s just one list. The pair- wise merging requires $\Theta(n)$ work at each level, since it is still working on $n$ elements, even if they are partitioned among sublists. The number of levels, starting with $n/k$ lists (with $k$ elements each) and finishing with 1 list (with $n$ elements), is $\lceil \lg(n/k) \rceil$. Therefore, the total running time for the merging is $\Theta (n \lg(n/k))$.

    5. Given that the modified algorithm runs in $\Theta(nk + n \lg (n/k))$ worst-case time, what is the largest value of $k$ as a function of $n$ for which the modified algorithm has the same running time as standard merge sort, in terms of $\Theta$-notation?
    6. How should we choose $k$ in practice?
       
24. adfsa

   

[Back to Fundamentals](./fundamentals.md)

[Data Structures and Algorithms Table of Contents](./cs124.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
