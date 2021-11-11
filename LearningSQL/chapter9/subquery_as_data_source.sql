SELECT c.first_name, c.last_name,
pymnt.num_rentals, pymnt.tot_payments
FROM customer c
INNER JOIN
(
    SELECT customer_id, count(*) num_rentals, sum(amount) tot_payments
    FROM payment
    GROUP BY customer_id
) pymnt
ON c.customer_id = pymnt.customer_id;