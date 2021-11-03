-- Here COUNT, used in 2 different ways. Count all customer rows and all distinct IDs
SELECT COUNT(customer_id) num_rows,
COUNT(DISTINCT customer_id) num_customers
FROM payment;

