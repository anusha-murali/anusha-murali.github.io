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

**Example 3**: **Transposing a matrix using the `zip()` function**

Let us consider the following $3 \times 3$ matrix.


We can find its transpose easily using the `zip()` function as shown below:

```
grid = [[3,2,1],[1,7,6],[2,7,7]]
transpose = list(zip(*grid))
```
**Explanation**: First we unpack the matrix (list of lists) using `*grid`. This gives us the iterable, `[3, 2, 1] [1, 7, 6] [2, 7, 7]`. So, `zip(*grid)` zips the corresponding elements from each of the three lists and returns a zip object. Finally, `list()` turns the zip object into the list, `[([3, 2, 1],), ([1, 7, 6],), ([2, 7, 7],)]`.

We can print `transpose` and confirm:
```
print(transpose)
[([3, 2, 1],), ([1, 7, 6],), ([2, 7, 7],)]
```
* * *
###### anusha-murali.github.io


<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
