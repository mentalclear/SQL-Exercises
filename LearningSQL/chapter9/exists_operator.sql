SELECT c.first_name, c.last_name
FROM customer c
WHERE EXISTS
(SELECT 1 FROM rental r
WHERE r.customer_id = c.customer_id
AND date(r.rental_date) < '2005-05-25');

-- The actual data that subquery returns is irrelevant
SELECT c.first_name, c.last_name
FROM customer c
WHERE EXISTS
(SELECT r.rental_date, r.customer_id, 'ABCD' str, 2 * 3 / 7 nmbr
FROM rental r
WHERE r.customer_id = c.customer_id
AND date(r.rental_date) < '2005-05-25');

-- However, the convention is to specify either 
-- select 1 or select * when using exists.


-- Not Exists
SELECT a.first_name, a.last_name
FROM actor a
WHERE NOT EXISTS
(SELECT 1
FROM film_actor fa
INNER JOIN film f ON f.film_id = fa.film_id
WHERE fa.actor_id = a.actor_id
AND f.rating = 'R');