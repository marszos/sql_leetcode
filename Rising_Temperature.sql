# Write your MySQL query statement below
select id 
from (
select *, lag(temperature, 1) over (order by recordDate) as 'temp_yest'
FROM Weather ) x 
where x.temperature  > x.temp_yest
