/* Write your T-SQL query statement below */
SELECT DISTINCT viewer_id 'id'
FROM Views
WHERE viewer_id = author_id
ORDER BY viewer_id;

