SELECT 100 / 0;

-- Wrap all denominators in conditional logic.
SELECT c.first_name, c.last_name,
sum(p.amount) tot_payment_amt,
count(p.amount) num_payments,
sum(p.amount) /
    CASE WHEN count(p.amount) = 0 THEN 1
        ELSE count(p.amount)
    END avg_payment
FROM customer c
LEFT OUTER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name;