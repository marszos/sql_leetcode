# Write your MySQL query statement below
SELECT email
FROM person
GROUP BY email
HAVING count(*) > 1

#https://leetcode.com/problems/duplicate-emails/
