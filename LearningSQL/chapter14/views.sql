-- Version adopted for PostgreSQL
CREATE VIEW customer_vw
 (customer_id,
  first_name,
  last_name,
  email 
 )
AS
SELECT 
  customer_id,
  first_name,
  last_name,
  concat(substr(email,1,2), '*****', RIGHT(email, 4) ) email
FROM customer;

SELECT first_name, last_name, email
FROM customer_vw;

-- Any clauses can be used:
SELECT first_name, count(*), min(last_name), max(last_name)
FROM customer_vw
WHERE first_name LIKE 'J%'
GROUP BY first_name
HAVING count(*) > 1
ORDER BY 1;

-- Joins can be used as well
SELECT cv.first_name, cv.last_name, p.amount
FROM customer_vw cv
INNER JOIN payment p
ON cv.customer_id = p.customer_id
WHERE p.amount >= 11;





-- To delete a view
DROP VIEW customer_vw;