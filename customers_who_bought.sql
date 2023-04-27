with cte as (
SELECT  *, dense_rank() OVER (PARTITION BY customer_id order by product_key asc) as x
from Customer), 
cte1 as ( 
select cte.customer_id, sum(DISTINCT(cte.x)) as suma
from cte
group by cte.customer_id),
cte2 as (
  select dense_rank() OVER (order by product_key asc) y 
  from Product 
),
cte3 as (
select sum(cte2.y) as sum2
from cte2)
select cte1.customer_id 
from cte1
join cte3
on cte1.suma = cte3.sum2
