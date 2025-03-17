### Maximum and Minimum Values of Partitioning Array: Example

Given the integer array, $A = [2, 4, 3, 5]$, find the maximum and minimum values of partitioning $A$ into $p=2$ contiguous partitions. 

We will find the maximum value by stepping through the above function below. The minimum value can be found similarly.

Our 2D array, `dp_max`, is first initialized as follows:

<p align="center"> <img width="350" alt="DP1" src="https://github.com/user-attachments/assets/1ea9e871-d8f5-489e-b745-128e425e901e" /> </p>

Let $i = 1$. So, we are considering the subarray of $A$ with just 1 element, which is 2.  For $i=1, j=1, k=0$, `value = 2*A[0] = 4`.
So, `dp_max[j][i] = max(dp_max[j][i], dp_max[j - 1][k] + value)` = $\max(-\infty, 0 + 4) = 4$. So `dp_max[1][1] = 4`. Hence `dp_max` will become:

<p align="center"> <img width="350" alt="DP2" src="https://github.com/user-attachments/assets/3fb37e9c-ed03-4fc5-9e8b-6692080b2026" /> </p>

Now while $i$ is still $i = 1$, $j$ becomes $j = 2$. For $i=1, j=2, k=0$, `value = 2*A[0] = 4`. 
So, `dp_max[2][1] = max(dp_max[2][1], dp_max[2 - 1][0] + value)` = $\max(-\infty, -\infty + 4) = -\infty$. So `dp_max[2][1] =` $-\infty$. Hence `dp_max`, does not change.

We have now completed the iteration for $i=1$. So, $i$ now becomes $i=2$.

When $i=2, j = 1, k =0$, `value = A[0] + A[1] = 2 + 4 = 6`. Hence evaluating,
`dp_max[j][i] = dp_max[1][2] = max(dp_max[j][i], dp_max[j - 1][k] + value) = 6`. Therefore, `dp_max` becomes:

<p align="center"> 
<img width="350" alt="DP3" src="https://github.com/user-attachments/assets/147428da-ac2e-4ce0-827b-0ba2e5dfc929" />
</p>

Now $k$ is incremented to $k = 1$. So, $i=2, j = 1, k = 1$. We find that `dp_max[1][2]` doesn't change and still remains `dp_max[1][2] = 6`.

Now $j$ is incremented to $j = 2$. So, $i=2, j=2, k=0$.  Hence evaluating,
`dp_max[j][i] = dp_max[2][2] = max(dp_max[j][i], dp_max[j - 1][k] + value) =` $\max(-\infty, -\infty) = -\infty$. Hence `dp_max`, does not change.

Now $k$ is incremened to $k=1$. So, $i=2, j=2, k=1$. So `value = 2*A[1] = 8`.  Hence evaluating,
`dp_max[j][i] = dp_max[2][2] = max(dp_max[j][i], dp_max[j - 1][k] + value) = ` $\max(-\infty, 4 + 8) = 12$. Therefore, `dp_max` becomes:

<p align="center"> 
<img width="350" alt="DP4" src="https://github.com/user-attachments/assets/86379e64-bc11-4505-8e30-de49b56b0b97" />
</p>

We have now completed the iteration for $i=2$. So, $i$ now becomes $i=3$.

When $i=3, j = 1, k =0$, `value = A[0] + A[2] = 2 + 3 = 5`. Hence evaluating,
`dp_max[j][i] = dp_max[1][3] = max(dp_max[j][i], dp_max[j - 1][k] + value) =` $\max(-\infty, 0 + 5) = 5$. Therefore, `dp_max` becomes:

<p align="center"> 
<img width="350" alt="DP5" src="https://github.com/user-attachments/assets/351d3556-45fc-4c6a-9304-ba8ed201393a" />
</p>

Now $k$ is incremented to $k = 1$. So, $i=3, j = 1, k = 1$. So `value = A[1] + A[3-1] = 4 + 3 = 7`. Hence evaluating,
`dp_max[j][i] = dp_max[1][3] = max(dp_max[j][i], dp_max[j - 1][k] + value) =` $\max(5, -\infty + 7) = 5$. Therefore, `dp_max` does not change.

Again $k$ is incremented to $k = 2$. So, $i=3, j = 1, k = 2$. So `value = A[2] + A[3-1] = 6`. Hence evaluating,
`dp_max[j][i] = dp_max[1][3] = max(dp_max[j][i], dp_max[j - 1][k] + value) =` $\max(5, -\infty + 6) = 5$. Therefore, `dp_max` does not change.

Now $j$ is incremented to $j = 2$. So, $i=3, j=2, k=0$.  So `value = A[0] + A[2] = 5`. Hence evaluating,
`dp_max[j][i] = dp_max[2][3] = max(dp_max[j][i], dp_max[j - 1][k] + value) =` $\max(-\infty, -\infty + 5) = -\infty$. Hence `dp_max`, does not change.

Now $k$ is incremened to $k=1$. So, $i=3, j=2, k=1$. So `value = A[1] + A[2] = 7`.  Hence evaluating,
`dp_max[j][i] = dp_max[2][3] = max(dp_max[j][i], dp_max[j - 1][k] + value) = ` $\max(-\infty, 4 + 7) = 11$. Therefore, `dp_max` becomes:

<p align="center"> 
<img width="350" alt="DP6" src="https://github.com/user-attachments/assets/c13b2480-8ce6-4231-9907-d14a087831ec" />
</p>

Now $k$ is incremened to $k=2$. So, $i=3, j=2, k=2$. So `value = 2*A[2] = 6`.  Hence evaluating,
`dp_max[j][i] = dp_max[2][3] = max(dp_max[j][i], dp_max[j - 1][k] + value) = ` $\max(11, 6+6) = 12$. Therefore, `dp_max` becomes:

<p align="center"> 
<img width="350" alt="DP7" src="https://github.com/user-attachments/assets/97ef27ab-cc50-422c-8cce-90c90ff3724a" />
</p>


We have now completed the iteration for $i=3$. So, $i$ now becomes $i=4$.

When $i=4, j = 1, k =0$, `value = A[0] + A[3] = 2 + 5 = 7`. Hence evaluating,
`dp_max[j][i] = dp_max[1][4] = max(dp_max[j][i], dp_max[j - 1][k] + value) =` $\max(-\infty, 0 + 7) = 7$. Therefore, `dp_max` becomes:

<p align="center"> 
<img width="350" alt="DP8" src="https://github.com/user-attachments/assets/eb45c6a5-6672-4080-9c4e-3e7ed70277d6" />
</p>

Now $k$ is incremented to $k = 1$. So, $i=4, j = 1, k = 1$. So `value = A[1] + A[4-1] = 4 + 5 = 9`. Hence evaluating,
`dp_max[j][i] = dp_max[1][4] = max(dp_max[j][i], dp_max[j - 1][k] + value) =` $\max(7, -\infty + 9) = 7$. Therefore, `dp_max` does not change.

Again $k$ is incremented to $k = 2$. So, $i=4, j = 1, k = 2$. So `value = A[2] + A[4-1] = 8`. Hence evaluating,
`dp_max[j][i] = dp_max[1][4] = max(dp_max[j][i], dp_max[j - 1][k] + value) =` $\max(7, -\infty + 8) = 7$. Therefore, `dp_max` does not change.

Again $k$ is incremented to $k = 3$. So, $i=4, j = 1, k = 3$. So `value = 2*A[3] = 10`. Hence evaluating,
`dp_max[j][i] = dp_max[1][4] = max(dp_max[j][i], dp_max[j - 1][k] + value) =` $\max(7, -\infty + 10) = 7$. Therefore, `dp_max` does not change.


Now $j$ is incremented to $j = 2$. So, $i=4, j=2, k=0$.  So `value = A[0] + A[3] = 7`. Hence evaluating,
`dp_max[j][i] = dp_max[2][4] = max(dp_max[j][i], dp_max[j - 1][k] + value) =` $\max(-\infty, -\infty + 7) = -\infty$. Hence `dp_max`, does not change.

Now $k$ is incremented to $k = 1$. So, $i=4, j = 2, k = 1$. So `value = A[1] + A[4-1] = 4 + 5 = 9`. Hence evaluating,
`dp_max[j][i] = dp_max[2][4] = max(dp_max[j][i], dp_max[j - 1][k] + value) =` $\max(-\infty, 4 + 9) = 13$. 

Therefore, `dp_max` becomes:

<p align="center"> 
<img width="350" alt="DP9" src="https://github.com/user-attachments/assets/833b2ac5-bb1c-45a4-bed9-32e6dd91d14e" />
</p>


Now $k$ is incremented to $k = 2$. So, $i=4, j = 2, k = 2$. So `value =A[2] + A[4-1] = 3 + 5 = 8`. Hence evaluating,
`dp_max[j][i] = dp_max[2][4] = max(dp_max[j][i], dp_max[j - 1][k] + value) =` $\max(13, 6 + 8) = 14.$ 

Therefore, `dp_max` becomes:

<p align="center"> 
<img width="350" alt="DP10" src="https://github.com/user-attachments/assets/7317b76f-cdbc-490c-81fa-e0a309aed497" />
</p>

Finally $k$ is incremented to $k = 3$. So, $i=4, j = 2, k = 3$. So `value =2*A[3] = 10`. Hence evaluating,
`dp_max[j][i] = dp_max[2][4] = max(dp_max[j][i], dp_max[j - 1][k] + value) =` $\max(14, 5 + 10) = 15.$ 

Therefore, `dp_max` becomes:

<p align="center">     
<img width="350" alt="DP11" src="https://github.com/user-attachments/assets/59240158-b9d6-4f2e-a45f-912b0bc278b1" />
</p>

Now the program terminates and `dp_max[p][n] = dp_max[2][4] = 15` is the maximum value possible.



[Back to Dynamic Programming Problems](./problems.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50" align="left">

[<img src="https://github.com/user-attachments/assets/989cfb30-4fb8-40f8-a812-8a054869aa32" width="50" height="50" align="right">](../index.md)
