with cte as (
  select order_date, buyer_id 
  from Orders
  where YEAR(date_format(order_date, '%Y-%m-%d')) = 2019
),
cte2 as (
select us.user_id, us.join_date, cte.*, ifnull(count(order_date), 0) as orders_in_2019
from Users us 
left join cte 
on us.user_id = cte.buyer_id 
group by user_id)
select user_id as buyer_id, join_date, orders_in_2019
from cte2 
