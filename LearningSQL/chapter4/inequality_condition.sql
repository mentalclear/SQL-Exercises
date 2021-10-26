SELECT c.email
FROM customer c
INNER JOIN rental r
ON c.customer_id = r.customer_id
WHERE r.rental_date::date <> '2005-06-14'
ORDER BY email;