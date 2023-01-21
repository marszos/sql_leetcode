# Write your MySQL query statement below // doesnt work on big dataset 
select id 
from (
select *, lag(temperature, 1) over (order by recordDate) as 'temp_yest'
FROM Weather ) x 
where x.temperature  > x.temp_yest


SELECT id
FROM
(
SELECT id, recordDate, temperature AS today_temp, LAG(temperature,1) OVER (ORDER BY recordDate) AS yesterday_temp, LAG(recordDate,1) OVER (ORDER BY recordDate) AS yes_date

FROM Weather
) AS temp_table

WHERE today_temp>yesterday_temp AND DATEDIFF(recordDate,yes_date)=1



select w2.id
from Weather w1
join Weather w2 
on w2.recordDate - 1 = w1.recordDate
where w2.temperature > w1.temperature
