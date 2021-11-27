SELECT f.film_id, f.title, i.inventory_id
FROM inventory i
RIGHT OUTER JOIN film f
ON f.film_id = i.film_id
WHERE f.film_id BETWEEN 13 AND 15;