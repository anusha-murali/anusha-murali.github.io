### 21. Weather Observation Station 6: Solution

---
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

The STATION table is described as follows:

<p align="center">
<img width="300" alt="16" src="https://github.com/user-attachments/assets/32081b67-bab3-4d54-9780-cbf8cc7abee7" />
</p>

where `LAT_N` is the northern latitude and `LONG_W` is the western longitude.


`SELECT DISTINCT CITY FROM STATION WHERE SUBSTR(CITY, 1, 1) IN ('A', 'E', 'I', 'O', 'U');`

---

**[Back to problems](./problems.md)**

* * *
###### anusha-murali.github.io

<img src="https://github.com/anusha-murali/anusha-murali.github.io/assets/111596338/639243aa-2857-4595-a65a-7852762bb002" width="50" height="50"/>
