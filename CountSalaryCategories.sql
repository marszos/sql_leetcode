with cte1 as (
select account_id, income, 
case when income < 20000 then 1 else 0  end as 'Low',
case when income >= 20000 and income <= 50000 then 1 else 0 end as 'Average',
case when income > 50000 then 1 else 0 end as 'High'
from Accounts) 
select "Low Salary" as category,sum(low) as accounts_count from cte1
union 
select "Average Salary" as category,sum(Average) as accounts_count from cte1
union 
select "High Salary" as category,sum(High) as accounts_count from cte1
