/* Write your T-SQL query statement below */
SELECT p.project_id, CAST(AVG(e.experience_years * 1.0) AS DECIMAL(10, 2)) 'average_years'
FROM Project p JOIN Employee e ON (p.employee_id = e.employee_id)
GROUP BY p.project_id;

/* https://leetcode.com/problems/project-employees-i/ */