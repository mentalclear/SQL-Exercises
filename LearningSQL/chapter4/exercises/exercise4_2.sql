SELECT payment_id, customer_id, amount, payment_date::date
FROM payment
WHERE payment_id BETWEEN 101 AND 120
AND customer_id = 5 AND NOT (amount > 6 OR date(payment_date) = '2005-06-19');