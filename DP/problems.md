<p align="center">
<img width="1375" alt="favorite_dp" src="https://github.com/user-attachments/assets/d16a688e-ed47-4a2d-a6b5-b9e85f740707" />
</p>

### Introduction

Dynamic programming (DP) is a method for solving complex problems by breaking them down into simpler subproblems. It is applicable when the problem has overlapping subproblems and optimal substructure. Following are some common techniques used in dynamic programming:

### 1. **Memoization (Top-Down Approach)**
   - **Description**: Memoization involves storing the results of expensive function calls and reusing them when the same inputs occur again. This is typically implemented using recursion and a cache (e.g., a hash table or array).
   - **Use Case**: Used when the problem can be broken down into overlapping subproblems, and you want to avoid redundant computations.
   - **Example**: Fibonacci sequence calculation.

### 2. **Tabulation (Bottom-Up Approach)**
   - **Description**: Tabulation involves solving the problem by filling up a table (usually an array or matrix) iteratively, starting from the smallest subproblems and building up to the solution of the main problem.
   - **Use Case**: Used when you want to avoid the overhead of recursion and stack space, and when the problem can be solved iteratively.
   - **Example**: Computing the nth Fibonacci number using an array.

### 3. **State Transition**
   - **Description**: This technique involves defining a state transition function that describes how to move from one state to another. The state typically represents a subproblem, and the transition function defines how to combine solutions of smaller subproblems to solve larger ones.
   - **Use Case**: Used in problems where the solution can be built from solutions to smaller subproblems.
   - **Example**: Longest Common Subsequence (LCS) problem.

### 4. **Space Optimization**
   - **Description**: This technique involves reducing the space complexity of the DP solution by reusing space or using variables instead of storing the entire DP table.
   - **Use Case**: Used when the problem allows for reducing the space complexity, often by noticing that only a few previous states are needed to compute the current state.
   - **Example**: Fibonacci sequence calculation using only two variables instead of an array.

### 5. **DP with Bitmasking**
   - **Description**: Bitmasking is used to represent subsets or states compactly using binary numbers. This is particularly useful in problems involving subsets, permutations, or combinations.
   - **Use Case**: Used in problems where the state can be represented as a subset of elements, such as the Traveling Salesman Problem (TSP).
   - **Example**: Solving the TSP using DP with bitmasking.

### 6. **DP on Trees**
   - **Description**: This technique involves applying dynamic programming on tree structures, where the state represents a subtree, and the transition involves combining results from child subtrees.
   - **Use Case**: Used in problems involving tree structures, such as finding the maximum independent set in a tree.
   - **Example**: Maximum sum of non-adjacent nodes in a tree.

### 7. **DP on Graphs**
   - **Description**: This technique involves applying dynamic programming on graph structures, where the state represents a node or a path, and the transition involves moving to adjacent nodes or edges.
   - **Use Case**: Used in problems involving shortest paths, longest paths, or other graph-related optimizations.
   - **Example**: Bellman-Ford algorithm for shortest paths with negative weights.

### 8. **DP with Probability**
   - **Description**: This technique involves incorporating probabilities into the DP state transitions, often used in problems involving stochastic processes or expected values.
   - **Use Case**: Used in problems where the outcome is probabilistic, such as expected number of moves to reach a goal.
   - **Example**: Calculating the expected number of dice rolls to get a specific sequence.

### 9. **DP with Multiple Parameters**
   - **Description**: This technique involves defining a DP state with multiple parameters, each representing a different dimension of the problem.
   - **Use Case**: Used in problems where the state is naturally described by multiple variables, such as knapsack problems with multiple constraints.
   - **Example**: 0/1 Knapsack problem with weight and volume constraints.

### 10. **DP with Divide and Conquer Optimization**
   - **Description**: This technique involves optimizing the DP solution by dividing the problem into smaller subproblems and combining their solutions in a way that reduces the overall complexity.
   - **Use Case**: Used in problems where the DP transition can be optimized by dividing the problem space, such as in certain string matching problems.
   - **Example**: Optimal Binary Search Tree problem.

### 11. **DP with Convex Hull Trick**
   - **Description**: This technique is used to optimize certain DP problems where the transition can be represented as a linear function, and the goal is to find the minimum or maximum of these functions efficiently.
   - **Use Case**: Used in problems where the DP transition involves minimizing or maximizing a linear function over a set of lines.
   - **Example**: Solving problems like the "Frog Jump" with cost functions.

### 12. **DP with Sliding Window**
   - **Description**: This technique involves maintaining a window of states and updating the DP table by sliding this window across the problem space, often used in problems with sequential data.
   - **Use Case**: Used in problems where the solution depends on a contiguous subsequence or subarray.
   - **Example**: Maximum sum subarray problem.

### 13. **DP with Matrix Exponentiation**
   - **Description**: This technique involves using matrix exponentiation to efficiently compute the DP state transitions, especially useful for problems with linear recurrences.
   - **Use Case**: Used in problems where the state transition can be represented as a matrix multiplication, such as in counting the number of ways to reach a state.
   - **Example**: Computing the nth Fibonacci number in logarithmic time.

### 14. **DP with Segment Trees or Fenwick Trees**
   - **Description**: This technique involves using advanced data structures like segment trees or Fenwick trees to efficiently query and update the DP table, especially in problems involving range queries.
   - **Use Case**: Used in problems where the DP solution requires efficient range queries or updates.
   - **Example**: Range minimum query (RMQ) problems.

### 15. **DP with Backtracking**
   - **Description**: This technique involves combining DP with backtracking to explore all possible solutions while using memoization to avoid redundant computations.
   - **Use Case**: Used in problems where you need to explore all possible solutions, such as in combinatorial problems.
   - **Example**: Solving the N-Queens problem with DP and backtracking.

These techniques can be combined or adapted depending on the specific problem at hand. The key to mastering dynamic programming is to recognize the patterns and apply the appropriate technique to optimize the solution.

1. [Rod Cutting](./rod_cutting.md)
2. [Fibonacci Sequence](./fibonacci.md)
3. [Catalan Numbers](./catalan.md)
4. [Maximum Sum Subarray](./max_sum_subarray.md)
5. [Longest Increasing Subsequence (LIS)](./lis.md)
6. [Longest Common Subsequence (LCS)](./lcs.md)
7. [Domino and Tromino Tiling](./domino.md)
8. [Minimum Cost of Climbing Stairs](./climbingStairs.md)
9. [Professional Robber](./robber.md)
10. [Maximum Repeating Substring](./1668.md)






* * *
###### anusha-murali.github.io


<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)


