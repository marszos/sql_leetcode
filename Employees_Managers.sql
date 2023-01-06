# Write your MySQL query statement below
SELECT employee.name as Employee
FROM Employee employee
JOIN Employee manager
ON employee.ManagerId = manager.Id
WHERE employee.salary >  manager.salary; 


#https://leetcode.com/problems/employees-earning-more-than-their-managers/
#https://www.youtube.com/watch?v=BGBXnNvWdQ4
