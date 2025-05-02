### Invert a Binary Tree

This is a simple problem from LeetCode (Problem #226).

**Problem**: Given the root of a binary tree, invert the tree, and return its root.

Example 1:

<img width="1300" alt="binary_tree_1" src="https://github.com/user-attachments/assets/460d5dc6-58f3-460d-a49d-e08509060605" />

Input: `root = [4, 2, 7, 1, 3, 6, 9]`

Output: `[4, 7, 2, 9, 6, 3, 1]`

Example 2:

Input: `root = []'

Output: `[]`

**Solution**

We can implement a simple solution using recursion as follows

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def invertTree(self, root: Optional[TreeNode]) -> Optional[TreeNode]:
        if not root:
            return root
        temp = self.invertTree(root.left)
        root.left = self.invertTree(root.right)
        root.right = temp
        return root
```

**Runtime**: Time complexity $O(n)$. Space complexity $O(n)$.

[Back to Binary Tree Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
