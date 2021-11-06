SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id = (
    SELECT MAX(customer_id) FROM customer
);


SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id = 599;