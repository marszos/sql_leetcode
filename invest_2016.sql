with cte as (select pid, count(tiv_2015) over (partition by tiv_2015) as tiv_agg,
count(concat(lat,lon)) over (partition by concat(lat,lon)) as lat_lon_agg, tiv_2016
from Insurance) 
select round(sum(tiv_2016),2) as tiv_2016
from cte 
where cte.tiv_agg != 1 and cte.lat_lon_agg = 1
