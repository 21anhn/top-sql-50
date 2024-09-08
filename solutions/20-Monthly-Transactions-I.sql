/* Write your T-SQL query statement below */
WITH AggregateWithoutConditions AS (
    SELECT FORMAT(t.trans_date, 'yyyy-MM') AS month, t.country AS country, COUNT(t.state) AS trans_count, SUM(t.amount) AS trans_total_amount
    FROM Transactions t
    GROUP BY FORMAT(t.trans_date, 'yyyy-MM'), t.country),
AggregateWithConditions AS (
    SELECT FORMAT(t.trans_date, 'yyyy-MM') AS month, 
            t.country AS country, 
            COUNT(CASE WHEN t.state = 'approved' THEN t.state ELSE NULL END) AS approved_count, 
            SUM(CASE WHEN t.state = 'approved' THEN t.amount ELSE 0 END) AS approved_total_amount
    FROM Transactions t
    GROUP BY FORMAT(t.trans_date, 'yyyy-MM'), t.country)
    
SELECT ac.month, ac.country, awc.trans_count, ac.approved_count, awc.trans_total_amount, ac.approved_total_amount 
FROM AggregateWithoutConditions awc JOIN AggregateWithConditions ac ON (awc.month = ac.month AND (awc.country = ac.country OR (awc.country IS NULL AND ac.country IS NULL)))

/* https://leetcode.com/problems/monthly-transactions-i/ */