SELECT f.film_id, f.title, count(*) num_copies
FROM film f
INNER JOIN inventory i 
ON f.film_id = i.film_id
GROUP BY f.film_id, f.title 
ORDER BY film_id ASC;


-- With outer join
SELECT f.film_id, f.title, count(i.inventory_id) num_copies
FROM film f
LEFT OUTER JOIN inventory i 
ON f.film_id = i.film_id
GROUP BY f.film_id, f.title 
ORDER BY film_id ASC;


-- Another example
SELECT f.film_id, f.title, i.inventory_id
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id
WHERE f.film_id BETWEEN 13 AND 15;

-- same with outer
SELECT f.film_id, f.title, i.inventory_id
FROM film f
LEFT OUTER JOIN inventory i
ON f.film_id = i.film_id
WHERE f.film_id BETWEEN 13 AND 15;

