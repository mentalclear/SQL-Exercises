-- 3 here references the column in the output table
-- so pretty much it's sorted by rantal_time column
SELECT c.first_name, c.last_name, r.rental_date::time rental_time
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'
ORDER BY 3 DESC;