/* Write your T-SQL query statement below */
SELECT a1.machine_id, CAST(AVG(ABS(a1.timestamp - a2.timestamp)) AS DECIMAL(10, 3)) 'processing_time'
FROM activity a1 JOIN activity a2 ON (a1.machine_id = a2.machine_id AND a1.process_id = a2.process_id AND a1.activity_type <> a2.activity_type)
GROUP BY a1.machine_id;

/* https://leetcode.com/problems/average-time-of-process-per-machine/ */