# Write your MySQL query statement below
with data as(
select departmentId, name as Employee, salary as Salary, dense_rank() over (partition by departmentId order by salary desc) as 'rank'
from Employee) 
select dep.name as Department, data.Employee, data.Salary
from data 
join Department as dep 
on data.departmentId = dep.id 
where data.rank < 4
