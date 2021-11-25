/*
    This one doesn't work in PostgreSQL
*/
SELECT
(
    SELECT c.first_name FROM customer c
    WHERE c.customer_id = p.customer_id
) first_name,
(
    SELECT c.last_name FROM customer c
    WHERE c.customer_id = p.customer_id
) last_name,
(
    SELECT ct.city
    FROM customer c
    INNER JOIN address a
    ON c.address_id = a.address_id
    INNER JOIN city ct
    ON a.city_id = ct.city_id
    WHERE c.customer_id = p.customer_id
) city, sum(p.amount) tot_payments, count(*) tot_rentals
FROM payment p
GROUP BY p.customer_id;