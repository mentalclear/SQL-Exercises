-- Expressions can be used along agreggate functions
-- In MySQL datediff() is used. This is used in PostgreSQL
SELECT MAX(DATE_PART('day', return_date - rental_date))
FROM rental;
