
# Bellman-Ford Algorithm

The Bellman-Ford algorithm allows us to find the shortest paths with arbitrary edge weights. We decrease $d[v]$ only when $d[v] > d[u] + length(u,v)$.
```
def update (u,v):
   if $d[v] > d[u] + length(u,v)$:
      $d[v] = d[u] + length(u,v)$
      $\pi[v] = u$
```


[Table of Contents](./index.md)

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
