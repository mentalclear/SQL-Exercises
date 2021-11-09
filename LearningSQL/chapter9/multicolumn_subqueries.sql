-- Single Column query here
SELECT fa.actor_id, fa.film_id
FROM film_actor fa
WHERE fa.actor_id IN
(SELECT actor_id FROM actor WHERE last_name = 'MONROE')
AND fa.film_id IN
(SELECT film_id FROM film WHERE rating = 'PG');

-- Multicolumn Subquery
SELECT actor_id, film_id
FROM film_actor
WHERE (actor_id, film_id) 
IN (SELECT a.actor_id, f.film_id
    FROM actor a
    CROSS JOIN film f
    WHERE a.last_name = 'MONROE'
    AND f.rating = 'PG'
);