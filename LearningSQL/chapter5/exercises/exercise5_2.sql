-- Subquery:
SELECT flm.title
FROM film flm
INNER JOIN 
    (SELECT act.first_name, fa.film_id
    FROM actor act
    INNER JOIN film_actor fa
    ON act.actor_id = fa.actor_id
    WHERE act.first_name = 'JOHN') acf
ON flm.film_id = acf.film_id;

-- Joins only:
SELECT flm.title
FROM film flm
INNER JOIN film_actor fa
ON flm.film_id = fa.film_id
INNER JOIN actor act
ON fa.actor_id = act.actor_id
WHERE act.first_name = 'JOHN';