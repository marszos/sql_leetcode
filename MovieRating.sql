with cte as (
    select mr.*, u.name, m.title
    from MovieRating mr
    left join Users u 
    on mr.user_id = u.user_id 
    left join Movies m 
    on mr.movie_id = m.movie_id
)
(select cte.name as results
from cte 
group by cte.name
order by count(*) desc, cte.name asc limit 1)
union 
(select cte.title as results
from cte
where month(cte.created_at) = 2
group by cte.title
order by avg(cte.rating) desc, cte.title asc limit 1)
