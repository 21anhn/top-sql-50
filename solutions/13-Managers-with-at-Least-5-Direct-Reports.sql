/* Write your T-SQL query statement below */
SELECT e1.name
FROM Employee e1 JOIN Employee e2 ON (e1.id = e2.managerId)
GROUP BY e1.name, e1.id
HAVING COUNT(e2.managerId) >= 5;

/* https://leetcode.com/problems/managers-with-at-least-5-direct-reports/ */