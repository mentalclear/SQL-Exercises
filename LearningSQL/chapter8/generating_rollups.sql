-- Adopted the query for PostgreSQL
SELECT fa.actor_id, f.rating, count(*)
FROM film_actor fa
INNER JOIN film f
ON fa.film_id = f.film_id
GROUP BY ROLLUP(fa.actor_id, f.rating) -- Similar to Oracle DB
ORDER BY 1,2;