# Write your MySQL query statement below
select id 
from (
select *, lag(temperature, 1) over (order by recordDate) as 'temp_yest'
FROM Weather ) x 
where x.temperature  > x.temp_yest



select w2.id
from Weather w1
join Weather w2 
on w2.recordDate - 1 = w1.recordDate
where w2.temperature > w1.temperature
