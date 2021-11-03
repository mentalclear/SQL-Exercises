SELECT fa.actor_id, f.rating, count(*)
FROM film_actor fa
INNER JOIN film f 
ON fa.film_id = f.film_id
GROUP BY fa.actor_id, f.rating
ORDER BY 1, 2;

-- I enhanced that a little
SELECT fa.actor_id, f.rating, count(*), CONCAT(act.first_name, ' ', act.last_name)
FROM film_actor fa
INNER JOIN film f 
ON fa.film_id = f.film_id
INNER JOIN actor act
ON fa.actor_id = act.actor_id
GROUP BY fa.actor_id, f.rating, act.actor_id
ORDER BY 1, 2;