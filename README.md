<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    jax: ["input/TeX", "output/HTML-CSS"],
    tex2jax: {
      inlineMath: [ ['$', '$'], ["\\(", "\\)"] ],
      displayMath: [ ['$$', '$$'], ["\\[", "\\]"] ],
      processEscapes: true,
      skipTags: ['script', 'noscript', 'style', 'textarea', 'pre', 'code']
    }
    //,
    //displayAlign: "left",
    //displayIndent: "2em"
  });
</script>
<script src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_HTML" type="text/javascript"></script>

## Hashing

### 1. The Birthday Paradox

Assuming birthdays are distributed uniformly at random across the 365 days of the year, how many people do there need to be in a room before there is a > 50% chance that two of them have the same birthday?

The probability the first two people have different birthdays is $`(1−\frac{1}{365})`$. So, the probability that all of the first $k$ people have different birthdays is,

```math
\left(1 - \frac{1}{365} \right)\left(1 - \frac{2}{365} \right) \cdots  \left(1 - \frac{k-1}{365} \right)
```

For $k=23$, this probability crosses over 49.3%. So, if there are at least 23 people in the room, the probability that two of them will have the same birthday is > 50%.


<!--
![111596338](https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002)
-->

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="100" height="100" />

##### anusha-murali.github.io
