SELECT first_name, last_name 
FROM customer
WHERE last_name LIKE 'Y%';

-- Adding an index in MySQL, doesn't work in PostgreSQL:
ALTER TABLE customer
ADD INDEX idx_email (email);

-- Works for PostgreSQL
CREATE INDEX idx_email 
ON customer (email);

-- Get index information
SELECT
    indexname,
    indexdef
FROM
    pg_indexes
WHERE
    tablename = 'customer';

-- Delete the index:
DROP INDEX idx_email;

--Creating UNIQUE INDEX
CREATE UNIQUE INDEX idx_email
ON customer (email);

-- Attempting to add duplicated entries will fail:
INSERT INTO customer
(store_id, first_name, last_name, email, address_id, active)
VALUES
(1,'ALAN','KAHN', 'ALAN.KAHN@sakilacustomer.org', 394, 1);

/*
 Returns this:
 ERROR: duplicate key value violates unique constraint "idx_email"
*/
 
 -- Multicolumn index
CREATE INDEX idx_full_name
ON customer (last_name, first_name);

-- Bitmap indexes, doesn't work in PostgreSQL
CREATE BITMAP INDEX idx_active ON customer (active);

/*
Explain statement is used to ask the server to show the execution plan 
for the query rather than executing the query:
*/

EXPLAIN
SELECT customer_id,first_name,last_name
FROM customer
WHERE first_name LIKE 'S%' AND last_name LIKE 'P%';