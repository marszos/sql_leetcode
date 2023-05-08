with cte1 as (
select user_id, count(action) as total 
from Confirmations 
group by user_id), 
cte2 as (
select user_id, count(action) confirm
from Confirmations
where action = 'confirmed'
group by user_id),
cte3 as ( 
select cte1.user_id, cte2.confirm / cte1.total as confirmation_rate
from cte1 
join cte2 
on cte1.user_id = cte2.user_id)
select sign.user_id, round(ifnull(cte3.confirmation_rate,0),2) as confirmation_rate
from Signups sign 
left join cte3 
on sign.user_id = cte3.user_id
