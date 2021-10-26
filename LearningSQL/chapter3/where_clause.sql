SELECT f.title
FROM film f
WHERE rating = 'G' AND rental_duration >= 7;

SELECT f.title
FROM film f
WHERE rating = 'G' OR rental_duration >= 7;

-- Grouping conditions together to use both 'and' and 'or'
SELECT f.title, f.rating, f.rental_duration
FROM film f
WHERE (rating = 'G' AND rental_duration >= 7)
OR (rating = 'PG-13' AND rental_duration < 4);