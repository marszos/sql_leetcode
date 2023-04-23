with cte as (
select requester_id as col1
from RequestAccepted 
union all
select accepter_id as col1
from RequestAccepted),
cte2 as ( 
select cte.col1 as id, count(*) as num 
from cte
group by cte.col1)
select cte2.id, cte2.num 
from cte2
where cte2.num = (select max(cte2.num) from cte2) 
