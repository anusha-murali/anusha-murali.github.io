### Longest Common Subsequence (LCS)

*** 

Given two strings $A$ and $B$ find their longest common subsequence or LCS.

> **Example**: $A$ = 'ANUSHAMURALI' and $B$ = 'ANUPAMURALI'. The LCS of $A$ and $B$ is 'ANUAMURALI' and its length is 10.


#### Solution 1: Top-down Recursion

If the last characters of strings $A$ and $B$ are equal, then we need to recursively compare the remaining strings after removing the last character. Otherwise, we have to compare one string with the other after removing the last character from one of them. We should do this for both strings and select the one with the larger value. Following is the Python code for this recursive approach:

```
def lcs(A, B, m, n):
    if m == 0 or n == 0:
        return 0
    if A[m-1] == B[n-1]:
        return 1 + lcs(A, B, m-1, n-1)
    else:
        return max(lcs(A, B, m-1, n), lcs(A, B, m, n-1))
```

**Runtime**: For a string containing $k$ characters, there are $2^k$ possible substrings. The above function computes all possible subsequences of both strings $A$ and $B$. Hence the runtime is $O(2^m \cdot 2^n) = O(2^{m+n})$. The space complexity is $O(\max(m, n))$ as the depth of the recursion is the larger of $m$ and $n$.

[Dynamic Programming](./dp.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
