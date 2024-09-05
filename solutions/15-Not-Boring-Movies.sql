/* Write your T-SQL query statement below */
SELECT c.id, c.movie, c.description, c.rating
FROM Cinema c
WHERE c.id % 2 <> 0 AND c.description <> 'boring'
ORDER BY c.rating DESC;

/* https://leetcode.com/problems/not-boring-movies/ */