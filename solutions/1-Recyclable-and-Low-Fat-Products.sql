/* Write your T-SQL query statement below */
SELECT pr.product_id
FROM Products pr
WHERE pr.low_fats = 'Y' AND pr.recyclable = 'Y';