/* Write your T-SQL query statement below */
WITH NumberOfUsers AS (
    SELECT COUNT(*) AS size
    FROM Users u
),
NumberOfUsersRegisterd AS (
    SELECT r.contest_id AS contest_id, COUNT(r.user_id) AS size_registered
    FROM Register r 
    GROUP BY r.contest_id
)

SELECT nr.contest_id, CAST((nr.size_registered * 1.0 / nu.size) * 100.0 AS DECIMAL(10, 2)) 'percentage'
FROM NumberOfUsers nu, NumberOfUsersRegisterd nr
ORDER BY CAST((nr.size_registered * 1.0 / nu.size) * 100.0 AS DECIMAL(10, 2)) DESC, nr.contest_id ASC;

/* https://leetcode.com/problems/percentage-of-users-attended-a-contest/ */
