-- Updating the view, not the table!
UPDATE customer_vw
SET last_name = 'SMITH-ALLEN'
WHERE customer_id = 1;

SELECT first_name, last_name, email
FROM customer
WHERE customer_id =1;

-- This shouldn't work! Email is partially hidden in that view
UPDATE customer_vw
SET email = 'MARY.SMITH-ALLEN@sakilacustomer.org'
WHERE customer_id = 1;

-- The INSERT shouldn't work either
INSERT INTO customer_vw
(customer_id, first_name, last_name)
VALUES (99999,'ROBERT','SIMPSON');