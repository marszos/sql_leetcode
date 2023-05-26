select customer_id, count(*) as count_no_trans 
from Visits 
where visit_id NOT IN (select visit_id from Transactions)
group by customer_id
