SELECT customer_id, count(*), SUM(amount) 
FROM payment
GROUP BY customer_id
HAVING count(*) > 39
ORDER BY 1;