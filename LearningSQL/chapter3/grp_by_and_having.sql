SELECT c.first_name, c.last_name, count(*)
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY c.first_name, c.last_name
HAVING count(*) >= 40;