/* Write your T-SQL query statement below */
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;

/* https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/ */
