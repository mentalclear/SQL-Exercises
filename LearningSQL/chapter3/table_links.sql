-- This is an example of time extraction from timestamp:

SELECT customer.first_name, customer.last_name, 
rental.rental_date::time as rental_time
FROM customer
INNER JOIN rental
    ON customer.customer_id = rental.customer_id
WHERE date(rental.rental_date) = '2005-06-14';