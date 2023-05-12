select u.name, ifnull(sum(r.distance),0) as travelled_distance
from Users u
left join Rides r 
on r.user_id = u.id
group by r.user_id 
order by travelled_distance desc, name asc
