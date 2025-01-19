### GCD of Strings

This is a beautiful problem from LeetCode (Problem #1071).

**Problem**: For two strings $s$ and $t$, we say "$t$ divides $s$" if and only if $s = t + t + t + ... + t + t$ 
(i.e., $t$ is concatenated with itself one or more times).

Given two strings `str1` and `str2`, return the largest string $x$ such that $x$ divides both `str1` and `str2`.

Example 1:

Input: `str1 = "ABCABC", str2 = "ABC"`; Output: `"ABC"`


Example 2:

Input: `str1 = "ABABAB", str2 = "ABAB"`; Output: `"AB"`


Example 3:

Input: `str1 = "LEET"`, `str2 = "CODE"`; Output: `""`

**Solution**

We note that if there is a non-empty GCD of `str1` and `str`, then it must be that `str1 + str2 == str2 + str1`.

If `str1 + str2 == str2 + str1`, then we want to return the slice of the length of GCD of either string. Hence, our code is as follows:

```
def gcdOfStrings(str1, str2):
   if str1 + str2 == str2 + str1:
      return str1[:math.gcd(len(str1), len(str2))]
   else:
      return ""
```

**Runtime**: 

[Back to String and Array Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
