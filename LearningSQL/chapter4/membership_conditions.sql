-- Finite set of values
SELECT title, rating
FROM film
WHERE rating = 'G' OR rating = 'PG';

-- The example for IN:
SELECT title, rating
FROM film
WHERE rating IN ('G', 'PG');

-- Using subqueries:
SELECT title, rating
FROM film
WHERE rating IN (
    SELECT rating FROM film WHERE title LIKE '%PET%'
);

-- Using NOT IN
SELECT title, rating
FROM film
WHERE rating NOT IN ('PG-13', 'R', 'NC-17');