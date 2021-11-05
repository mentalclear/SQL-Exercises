SELECT customer_id, count(*), SUM(amount) 
FROM payment
GROUP BY customer_id
ORDER BY 1;