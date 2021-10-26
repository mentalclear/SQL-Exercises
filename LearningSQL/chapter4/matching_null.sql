-- An expression can be null, but it can never equal null.
-- Two nulls are never equal to each other.

SELECT rental_id, customer_id
FROM rental
WHERE return_date IS NULL;

-- Worng example, cannot use '='
SELECT rental_id, customer_id
FROM rental
WHERE return_date = NULL;

-- If a value has been assigned to a column:
SELECT rental_id, customer_id, return_date
FROM rental
WHERE return_date IS NOT NULL;

-- Not Returned rentals between May and Aug 2005
SELECT rental_id, customer_id, return_date
FROM rental
WHERE return_date IS NULL 
OR return_date NOT BETWEEN '2005-05-01' AND '2005-09-01';

