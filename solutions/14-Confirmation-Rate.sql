/* Write your T-SQL query statement below */
WITH CountConfirmed AS (
    SELECT  c.user_id AS user_id, 
            COUNT(CASE WHEN c.action = 'confirmed' THEN c.action ELSE NULL END) AS confirmed_count
    FROM Confirmations c
    GROUP BY c.user_id),
CountTimeout AS (
    SELECT  s.user_id AS user_id, 
            COUNT(CASE WHEN c.action = 'timeout' THEN c.action ELSE NULL END) AS timeout_count
    FROM Confirmations c RIGHT JOIN Signups s ON (c.user_id = s.user_id)
    GROUP BY s.user_id),
CountSize AS (
    SELECT s.user_id AS user_id, COUNT(c.action) AS size
    FROM  Signups s LEFT JOIN Confirmations c ON (s.user_id = c.user_id)
    GROUP BY s.user_id
)

SELECT ct.user_id, 
        ROUND(CASE WHEN cc.confirmed_count IS NULL 
                        OR ct.timeout_count IS NULL 
                        OR cs.size IS NULL  
                        OR cs.size = 0 THEN 0 
                    ELSE cc.confirmed_count * 1.0 / cs.size END, 2) AS confirmation_rate
FROM CountTimeout ct LEFT JOIN CountConfirmed cc ON (ct.user_id = cc.user_id)
                          JOIN CountSize cs ON (cs.user_id = ct.user_id)

/* https://leetcode.com/problems/confirmation-rate/ */