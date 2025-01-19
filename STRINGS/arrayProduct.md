### Product of Array Except Self

**Problem**: Given an integer array `nums`, return an array answer such that `answer[i]` is equal to the product 
of all the elements of nums except `nums[i]`.

The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

You must write an algorithm that runs in $O(n)$ time and without using the division operation.

 

Example 1:

Input: `nums = [1,2,3,4]`; Output: `[24,12,8,6]`

Example 2:

Input: `nums = [-1,1,0,-3,3]`; Output: `[0,0,9,0,0]`


**Solution**

```
    def productExceptSelf(nums):
        import math
        if math.prod(nums) == 1:
            return nums
        res = []
        p = math.prod(nums)
        if p != 0:
            for i in range(len(nums)):
                res.append(p//nums[i])
        else:
            for i in range(len(nums)):
                res.append(math.prod(nums[:i] + nums[i+1:]))
        return res
```


**Runtime**:  $O(n)$.

[Back to String Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
