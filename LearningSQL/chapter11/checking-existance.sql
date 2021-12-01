SELECT a.first_name, a.last_name,
CASE
    WHEN EXISTS (SELECT 1 FROM film_actor fa
        INNER JOIN film f ON fa.film_id = f.film_id
        WHERE fa.actor_id = a.actor_id
        AND f.rating = 'G') THEN 'Y'
    ELSE 'N'
END g_actor,
CASE
    WHEN EXISTS (SELECT 1 FROM film_actor fa
        INNER JOIN film f ON fa.film_id = f.film_id
        WHERE fa.actor_id = a.actor_id
        AND f.rating = 'PG') THEN 'Y'
    ELSE 'N'
END pg_actor,
CASE
    WHEN EXISTS (SELECT 1 FROM film_actor fa
        INNER JOIN film f ON fa.film_id = f.film_id
        WHERE fa.actor_id = a.actor_id
        AND f.rating = 'NC-17') THEN 'Y'
    ELSE 'N'
END nc17_actor
FROM actor a
WHERE a.last_name LIKE 'S%' OR a.first_name LIKE 'S%';

-- Another example
SELECT f.title,
    CASE (SELECT count(*) FROM inventory i 
            WHERE i.film_id = f.film_id)
        WHEN 0 THEN 'Out Of Stock'
        WHEN 1 THEN 'Scarse'
        WHEN 2 THEN 'Scarse'
        WHEN 3 THEN 'Available'
        WHEN 4 THEN 'Available'
        ELSE 'Common'
    END film_availability
FROM film f;
