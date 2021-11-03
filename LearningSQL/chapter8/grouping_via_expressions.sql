-- Adapted for PostgreSQL
SELECT extract(YEAR FROM rental_date) AS year, 
COUNT(*) how_many
FROM rental
GROUP BY extract(YEAR FROM rental_date);