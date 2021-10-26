SELECT payment_id, customer_id, amount, payment_date::date
FROM payment
WHERE payment_id BETWEEN 101 AND 120
AND customer_id <> 5 AND (amount > 8 OR date(payment_date) = '2005-08-23');

