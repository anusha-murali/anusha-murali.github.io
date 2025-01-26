### Using $^*$args and $^{**}$kwargs in Python


There are three types of parameters in Python, namely:
- Positional-or-Keyword Parameters
- Positional-Only Parameters
- Keyword-Only Parameters

The *Positional-or-Keyword* parameter is the most commonly used one, where one can either specify the name of the parameter or not when calling the function.

The $^*$`args` and $^{**}$`kwargs` are typically used when a function has a varying (or arbitrary) number of
parameters.

The $^*$`args` is used to pass a varying number of arguments.

The $^{**}$`kwargs` is used to pass a varying number of dictionary arguments.

#### Understanding $^*$args

In Python, the single-asterisk form of $^*$`args` can be used as a parameter to pass a variable-length argument list to a function.

*Example*: We want to multiply the numbers in a list of unknown length.

```
def multiplyList(*lst):
  result = 1
  for num in lst:
    result *= num
  return result

multiplyList(10, 25)
multiplyList(4,5,6,7,8,9,10)
```

When we run the above, we get the following output:

```
250
604800
```

Since the function was defined using $^*$`args`,  we were able to pass in arbitrary number of arguments as we wanted into the function (in the first call 2 arguments and in the second call 7 arguments respectively).


#### Understanding $^{**}$kwargs

In Python, the double-asterisk form of `**kwargs` can be used as a parameter to pass a variable-length argument dictionary to a function. The main difference between $^*$`args` and `**kwargs` is that one needs to assign keys when using `**kwargs`.

*Example*: 

```
def printValues(**thisDict):
  for (key, value) in thisDict.items():
    print(key, ':', value)

printValues(a = 10, b = 20)
printValues(w = 101, x = 7, y = 5, z = 13)
```
When we run the above, we get the following output:

```
a : 10
b : 20

w : 101
x : 7
y : 5
z : 13
```

#### Using `*` and `**` as Arguments to a Function

As opposed to our discussion above, the functionality of `*` and `**`, when passed as arguments when calling a function, is to unpacking an iterable data structure (such as a list or a tuple) and a dictionary into individual arguments respectively.

*Example*:

```
def printValues(val1, val2, val3):
  print("Value 1: ", val1, " Value 2: ", val2, " Value 3: ", val3)

myList = [100, 200, 300]
printValues(*myList)
```
When we run the above, we get the following output:
```
Value 1:  100  Value 2:  200  Value 3:  300
```

An example usagee of `**` is as follows.

```
myDict = {"val1" : 5, "val2" : 12, "val3" : 40}
printValues(**myDict)
```
When we run the above, we get the following output:
```
Value 1:  5  Value 2:  12  Value 3:  40
```

Note that the keys in `myDict` corresponds to the names of the arguments defined in the function, namely `"val1"`, `"val2"`, and `"val3"`.

* * *
###### anusha-murali.github.io


<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)

