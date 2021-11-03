SELECT customer_id FROM rental
ORDER BY customer_id ASC;

-- GROUP BY
SELECT customer_id FROM rental
GROUP BY customer_id 
ORDER BY customer_id ASC;

-- AGGREGATE FUNCTION count()
SELECT customer_id, count(*)
FROM rental
GROUP BY customer_id
ORDER BY customer_id ASC;

SELECT customer_id, count(*)
FROM rental
GROUP BY customer_id
ORDER BY 2 DESC; -- Ordered by count descending

-- If any specific set needed use HAVING.
SELECT customer_id, count(*)
FROM rental
GROUP BY customer_id
HAVING count(*) >= 40
ORDER BY 2 DESC;
-- HAVING customer_id = 599;
