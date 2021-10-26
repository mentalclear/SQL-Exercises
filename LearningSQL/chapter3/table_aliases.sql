-- This is an example of time extraction from timestamp
-- plus table aliases are used here.
SELECT c.first_name, c.last_name, 
r.rental_date::time as rental_time
FROM customer as c
INNER JOIN rental as r
    ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14';