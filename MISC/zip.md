### The `zip()` Function in Python

The `zip()` is one of the most useful functions in Python. It takes iterables such as lists and aggregate them into a **tuple**.

The syntax of the `zip()` function is,
```
zip(*iterables)
```
where the `iterables` can be one of the built-in iterables such as list, string, dict or any user-defined iterables.

**Example 1**
```
courses = ["CS124", "CS50", "CS182"]
scores = [94, 97, 91]

course_table = zip(courses, scores)
```
The result returned by `zip()` is an object. We can use `list()` to print the zip object:
```
print(list(course_table))
[('CS124', 94), ('CS50', 97), ('CS182', 91)]
```

We can also recover the original values used in the above example using `zip()` as shown below.

**Example 2**
```
courses, scores = zip(*course_table)
```
Following shows the contents of `courses` and `scores`:
```
print("courses = ", courses)
print("scores = ", scores)
courses =  ('CS124', 'CS50', 'CS182')
scores =  (94, 97, 91)
```
* * *
###### anusha-murali.github.io


<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
