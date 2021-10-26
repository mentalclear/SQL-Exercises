SELECT DISTINCT customer_id 
FROM rental
WHERE rental.rental_date::date = '2005-07-05';
