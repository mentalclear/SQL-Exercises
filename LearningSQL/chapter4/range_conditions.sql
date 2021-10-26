SELECT customer_id, rental_date
FROM rental
WHERE rental_date < '2005-05-25';


SELECT customer_id, rental_date
FROM rental
WHERE rental_date <= '2005-06-16'
AND rental_date >= '2005-06-14';

-- Between operator:
SELECT customer_id, rental_date
FROM rental
WHERE rental_date BETWEEN '2005-06-14' AND '2005-06-16';

-- With BETWEEN it's important to set a lower limit first 
-- and the upper limit second.
-- Worng:
SELECT customer_id, rental_date
FROM rental
WHERE rental_date BETWEEN '2005-06-16' AND'2005-06-14';

-- Ranges of numbers. Numerical:
SELECT customer_id, payment_date, amount
FROM payment
WHERE amount BETWEEN 10.0 AND 11.99;

-- String ranges:
SELECT last_name, first_name
FROM customer
WHERE last_name BETWEEN 'FA' AND 'FR';

-- Extending the range:
SELECT last_name, first_name
FROM customer
WHERE last_name BETWEEN 'FA' AND 'FRB';