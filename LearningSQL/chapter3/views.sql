-- Created a view:
CREATE VIEW cust_vw AS 
SELECT customer_id, first_name, last_name, active
FROM customer;

-- Querying the view
SELECT first_name, last_name
FROM cust_vw
WHERE active = 0;

-- Views are created to show users only those colums that they need to see.
