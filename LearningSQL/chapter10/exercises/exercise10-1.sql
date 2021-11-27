SELECT c.name, sum(p.amount)
FROM customer c 
LEFT OUTER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.name;