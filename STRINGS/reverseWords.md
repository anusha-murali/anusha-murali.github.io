### Reverse Words in a String

**Problem**: Given an input string $s$, reverse the order of the words.

A word is defined as a sequence of non-space characters. The words in $s$ will be separated by at least one space.

Return a string of the words in reverse order concatenated by a single space.

Note that $s$ may contain leading or trailing spaces or multiple spaces between two words. 
The returned string should only have a single space separating the words. Do not include any extra spaces.

 
Example 1:

Input: `s = "the sky is blue"`; Output: `"blue is sky the"`

Example 2:

Input: `s = "  hello world  "`; Output: `"world hello"`

Explanation: Your reversed string should not contain leading or trailing spaces.

Example 3:

Input: `s = "a good   example"`; Output: `"example good a"`

Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.

**Solution**

```
    def reverseWords(s):
        tempList = list(s.split())
        newStr = ''
        for i in range(len(tempList)-1, -1, -1):
            newStr += tempList[i]
            if i != 0:
                newStr += ' '
        return newStr
```

**Runtime**: Since the **for** loop is iterating over the words in the original string $s$, the runtime is $O(n)$, where $n$ is the
number of words in $s$.

[Back to String Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
