
select Department, Employee, Salary from (
select dept.name as Department, emp.name as  Employee, emp.salary as Salary,
rank() over (partition by dept.name order by emp.salary desc) as 'rank'
from Employee emp 
join Department dept 
on emp.departmentId = dept.id ) x 
WHERE x.rank < 2;
