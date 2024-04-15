## Hashing

### 1. The Birthday Paradox

Assuming birthdays are distributed uniformly at random across the 365 days of the year, how many people do there need to be in a room before there is a > 50% chance that two of them have the same birthday?

The probability the first two people have different birthdays is $(1−\frac{1}{365})$. So, the probability that all of the first $k$ people have different birthdays is,

<!--
```math
\left(1 - \frac{1}{365} \right)\left(1 - \frac{2}{365} \right) \cdots  \left(1 - \frac{k-1}{365} \right)
```
-->

$$
\left(1 - \frac{1}{365} \right)\left(1 - \frac{2}{365} \right) \cdots  \left(1 - \frac{k-1}{365} \right)
$$

For $k=23$, this probability crosses over 49.3%. So, if there are at least 23 people in the room, the probability that two of them will have the same birthday is > 50%.

### 2. Balls into Bins

The birthday paradox is often formulated in terms of balls and bins. 

Consider $n$ balls that are randomly thrown into $m$ bins. 

#### Collision Probability

The probability that all of the $n$ balls land in different bins, given that $n < m$ is,

$$
\left(1 - \frac{1}{m}\right) \left(1 - \frac{2}{m}\right) \cdots \left(1 - \frac{n-1}{m}\right) \leq \text{exp}\left ( -\frac{1}{m}\sum_{i=1}^{n-1}i \right) \leq \text{exp}(-\Omega(n^2/m))
$$

#### Number of Empty Bins

For the first bin to be empty, it has to be missed by all $n$ balls. Since each ball hits the first bin with probability $\frac{1}{m}$, the probability that the first bin remains empty is,

$$
\left(1 - \frac{1}{m} \right)^n \approx e^{-n/m}.
$$

Since the same argument holds for all bins, on average an $e^{-n/m}$ fraction of the bins will remain empty.

<!--
![111596338](https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002)
-->

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>

