### Maximum Sum Subarray

***

Find a non-empty contiguous subarray of a given array $A$ such that it has the largest possible sum.

> **Example**: $A = [5, -2, 4, -10,  7, -2, 3, -8]$. The maximum sum subarray of $A$ is $[7, -2, 3]$ and the maximum sum is 8.

How many possible contiguous subarrays of any size are there in an array of size $n$?

Using the above example, we see that there are 8 subarrays of length 1, namely $[5],  [-2], [4],$ $[-10],  [7]$, $[-2], [3]$ and  $[-8]$. There are 7 subarrays of length 2, namely $[5, -2],$ $[-2, 4], [4, -10]$, $[-10, 7], [7, -2]$, $[-2, 3]$ and  $[3, -8]$. In this manner, there will be 6 contiguous subarrays of length 3, and so on. Therefore, we see that there are $n + (n-1) + \cdots + 1 = n(n+1)/2$ contiguous subarrays of any size in an array of size $n.$ Hence, a naive or brute-force algorithm which examines all possible subarrays will have $O(n^2)$ runtime.

#### Solution 1: Brute-force algorithm

```
def maxSumSubarray(A):
    maxVal = float('-inf')
    for i in range(len(A)):
        localSum = 0
        for j in range(i, len(A)):
            localSum = localSum + A[j]
            if localSum > maxVal:
                maxVal = localSum
    return maxVal
```

Obviously the brute-force algorithm is $O(n^2)$.

### 2. Dynamic Programming: Kadane's Algorithm

Let us say that for each index $i$ of the given array $A$, DP$[i]$ denotes the maximum possible sum of the contiguous subarray of $A[0\cdots i]$.

Therefore, DP$[i-1]$ denotes the maximum sum of the contiguous subarray of $A[0\cdots i-1]$.

Now consider the array $A[0\cdots i]$. We see that the maximum sum of the contiguous subarray of $A[0\cdots i]$ is $\max(\text{DP}[i-1] + A[i], A[i])$.

This is because if DP$[i-1] + A[i] < A[i]$, then DP$[i-1] < 0$. So, a subarray consisting of $A[i]$ by itself will have a larger sum than DP$[i-1]$. In other words, only when DP$[i-1]$ is positive, it will be useful to remain in the subarray. If not, we should look for a new contiguous subarray starting with the element $A[i]$. The idea is that if we encounter a subarray that has a negative sum, we discard it and only consider a subarray that has a positive sum.

Letting DP$[0] = A[0]$ and using 

$$
\text{DP}[i] = \max(\text{DP}[i-1] + A[i], A[i]),
$$

we can find the largest sum of array $A$ in just one pass over the array.

```
def maxSumSubarray(A):
    DP = [0]*len(A)  
    DP[0] = A[0]
    for i in range(1, len(A)):
        DP[i] = max(DP[i-1] + A[i], A[i])
    return max(DP)
```

Since we are only making a single pass over the array, the runtime of the dynamic programming solution above is $O(n)$.

How do we find the contiguous subarray that gives the largest sum? Let us say that $DP[0\cdots n-1]$ contains the maximum sums for subarrays of size $0$ to $n-1$. The following routine returns the contiguous subarray that gives the largest sum.

```
def findSubarray(A, DP):
    m = max(DP)
    end = DP.index(m)
    start = end
    while m > 0:
        m = m - A[start]
        start = start - 1
    return A[start+1 : end+1]
```

### Maximum Sum Circular Subarray

***

Find a non-empty contiguous subarray of a given circular array $A$ of length $n$ such that it has the largest possible sum.

> **Example**: $A = [7, -12, 2, 6]$. The maximum sum circular subarray of $A$ is $[2, 6, 7]$ and the maximum sum is 15.

#### Solution 1: Kadane Algorithm on Array of $2n$ Length

We can view the circular array as a linear array of length $2n$, and apply Kadane algorithm $n$ times on an array of length $n$, each time shifting the starting position right by one index.

```
def maxSumCircularSubarray(A):
    B = A + A
    maxSum = float('-inf')
    for i in range(len(A)):
        temp = maxSumSubarray(B[i:i+len(A)])
        if temp > maxSum:
            maxSum = temp
    return maxSum
```
The runtime of this approach is $O(n^2)$ as we are calling Kadane algorithm (maxSumSubarray()) $n$ times.

#### Solution 2: Modified Kadane Algorithm

We can find the minimum sum subarray using the Kadane algorithm. Let $x$ be the value obtained by subtracting this minimum sum from the linear sum of the entire array. The maximum sum of the circular subarray is the maximum of the maximum sum returned by the Kadane algorithm and $x$. 


```
def maxSumCircularSubarray(A):
    maxSum = maxSumSubarray(A)
    if maxSum < 0:
        return maxSum
    
    DP = [0]*len(A)
    DP[0] = A[0]
    for i in range(1, len(A)):
        DP[i] = min(DP[i-1] + A[i], A[i])

    return max(maxSum, sum(A) - min(DP))
```

The runtime of the above algorithm is $O(n)$ as we at most look at $2n$ elements.

### Longest Turbulent Subarray

***

A subarray is called turbulent if the comparision sign flips between each consecutive pair of elements in the subarray. Find the length of the longest turbulent subarray of a given array $A$.

If all elements of the array are equal, then we assume the length of the longest turbulent subarray is 1.

> **Example**: $A = [6, 3, 2, 9, 5, 6, 4, 2, 7]$. The longest turbulent subarray is $[2, 9, 5, 6, 4]$ and its length is 5.

```
def longestTurbulentSubarray(A):
    # If all elements of the array are equal, just return 1
    allEqual = True
    for i in range(1, len(A)):
        if A[i] != A[i-1]:
            allEqual = False
            exit
    if allEqual:
        return 1
    
    longest = 2  # At least 2 elements are in A
    count = 2
    for i in range(1, len(A)-1):
        if ((A[i] > A[i-1]) and (A[i+1] < A[i])) or \
           ((A[i] < A[i-1]) and (A[i+1] > A[i])):
            count = count + 1
            if count > longest:
                longest = count
        else:
            count = 2
    return longest
```

The runtime of the above function is $O(n)$ as the for loop runs over the entire array only once.

[Back to Dynamic Programming Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
