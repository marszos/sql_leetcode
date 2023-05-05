with cte1 as (
select *, row_number() over (partition by stock_name order by stock_name, operation_day) as 'rank'
from Stocks) 
select cte1.stock_name, 
sum(case when cte1.rank%2=0 then price else -price end) as capital_gain_loss
from cte1
group by cte1.stock_name 
order by capital_gain_loss desc
