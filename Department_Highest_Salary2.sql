WITH CTE as 
(SELECT departmentId, Name as Employee, Salary, 
DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY Salary DESC) as DenseRank
FROM Employee
)
SELECT Dep.Name as Department , CTE.Employee, CTE.Salary 
FROM CTE 
JOIN Department Dep
    ON CTE.departmentId = Dep.id
WHERE DenseRank = 1
