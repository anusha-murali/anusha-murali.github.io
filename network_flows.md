## The Ford-Fulkerson Method

**Max-flow Min-cut Theorem**: For every directed graph $G$, the maximum flow on $G$
with capacities $c$ equals the minimum cut in $G$ with capacities $c$.


If $f$ is a flow in a flow network $G = (V, E)$ with source $s$ and sink $t$,then the following conditions are equivalent:
1. $f$ is a maximum flow in $G$
2. The residual network $G_f$ contains no augmenting paths.
3. $\|f\| = c(S, T)$ for some cut $(S, T)$ of $G$.

Only the following edges can be used for augmentation:
1. Non-null forward edges
2. Non-empty backward edges

[Table of Contents](./index.md)
<!--
![111596338](https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002)
-->

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
