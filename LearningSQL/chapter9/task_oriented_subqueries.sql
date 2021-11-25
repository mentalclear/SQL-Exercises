SELECT c.first_name, c.last_name, ct.city,
sum(p.amount) tot_payments, count(*) tot_rentals
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_id = ct.city_id
GROUP BY c.first_name, c.last_name, ct.city;


-- Grouping subquery:
SELECT customer_id,
count(*) tot_rentals, sum(amount) tot_payments
FROM payment
GROUP BY customer_id;

SELECT c.first_name, c.last_name, ct.city,
pymnt.tot_payments, pymnt.tot_rentals
FROM (
    SELECT customer_id, count(*) tot_rentals, sum(amount) tot_payments
    FROM payment
    GROUP BY customer_id
) pymnt
INNER JOIN customer c
ON pymnt.customer_id = c.customer_id
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_id = ct.city_id;