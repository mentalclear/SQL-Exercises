CREATE VIEW customer_details
AS
SELECT c.customer_id,
    c.store_id,
    c.first_name,
    c.last_name,
    c.address_id,
    c.active,
    c.create_date,
    a.address,
    ct.city,
    cn.country,
    a.postal_code
FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_id = ct.city_id
INNER JOIN country cn
ON ct.country_id = cn.country_id;

SELECT * FROM customer_details LIMIT 100;

-- Update (didn't work)
UPDATE customer_details
SET last_name = 'SMITH-ALLEN', active = 0
WHERE customer_id = 1;