/* Write your T-SQL query statement below */
SELECT cs.name
FROM Customer cs
WHERE cs.referee_id != 2 OR cs.referee_id is NULL;