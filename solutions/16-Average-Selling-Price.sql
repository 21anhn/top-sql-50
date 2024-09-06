WITH Sum_Units_Table AS (
    SELECT p.product_id, SUM(ISNULL(un.units, 0)) AS sum_units
    FROM Prices p LEFT JOIN UnitsSold un ON (p.product_id = un.product_id)
    WHERE un.purchase_date BETWEEN p.start_date AND p.end_date OR un.purchase_date IS NULL
    GROUP BY p.product_id
),
Total_Table AS (
    SELECT p.product_id, SUM(ISNULL(p.price * u.units, 0)) AS total
    FROM Prices p
    LEFT JOIN UnitsSold u ON p.product_id = u.product_id
    WHERE u.purchase_date BETWEEN p.start_date AND p.end_date OR u.purchase_date IS NULL
    GROUP BY p.product_id
)

SELECT t.product_id, 
    CASE
        WHEN s.sum_units = 0 THEN 0 
        ELSE CAST(t.total * 1.0 / s.sum_units AS DECIMAL(10, 2)) 
    END AS average_price
FROM Total_Table t, Sum_Units_Table s
WHERE t.product_id = s.product_id;

/* https://leetcode.com/problems/average-selling-price/ */