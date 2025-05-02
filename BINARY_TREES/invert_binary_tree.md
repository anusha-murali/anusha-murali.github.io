### Invert a Binary Tree

This is a simple problem from LeetCode (Problem #226).

**Problem**: Given the root of a binary tree, invert the tree, and return its root.

Example 1:

<img width="1300" alt="binary_tree_1" src="https://github.com/user-attachments/assets/460d5dc6-58f3-460d-a49d-e08509060605" />



**Solution**

We note that if there is a non-empty GCD of `str1` and `str`, then it must be that `str1 + str2 == str2 + str1`.

If `str1 + str2 == str2 + str1`, then we want to return the slice of the length of GCD of either string. Hence, our code is as follows:

```python
def gcdOfStrings(str1, str2):
   if str1 + str2 == str2 + str1:
      return str1[:math.gcd(len(str1), len(str2))]
   else:
      return ""
```

**Runtime**: 

[Back to Binary Tree Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
