/* Write your T-SQL query statement below */
WITH NumberOfQueryNameRecord AS (
    SELECT q.query_name AS query_name, COUNT(q.result) AS size
    FROM Queries q
    GROUP BY q.query_name),
RatioRecord AS (
    SELECT q.query_name AS query_name, SUM(1.0 * q.rating / q.position) AS ratio
    FROM Queries q
    GROUP BY q.query_name),
PoorQueries AS (
	SELECT q.query_name, 
       	COUNT(CASE WHEN q.rating < 3 THEN q.result ELSE NULL END) AS size_queries_poor
	FROM Queries q
	GROUP BY q.query_name)

SELECT n.query_name, ROUND(r.ratio / n.size, 2) 'quality', ROUND(1.0 * p.size_queries_poor / n.size * 100, 2) 'poor_query_percentage'
FROM NumberOfQueryNameRecord n JOIN RatioRecord r ON (n.query_name = r.query_name)
                               JOIN PoorQueries p ON (r.query_name = p.query_name)

/* https://leetcode.com/problems/queries-quality-and-percentage/ */