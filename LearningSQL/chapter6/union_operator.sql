-- Union all will not remove duplicates
SELECT 'CUST' typ, c.first_name, c.last_name
FROM customer c
UNION ALL  -- Unino without all will remove duplicates.
SELECT 'ACTR' typ, a.first_name, a.last_name
FROM actor a;


-- An identical query to demo UNION ALL not removing duplicates.
SELECT 'ACTR' typ, a.first_name, a.last_name
FROM actor a
UNION ALL
SELECT 'ACTR' typ, a.first_name, a.last_name
FROM actor a;

-- Compund quiery that returns duplicate data.
SELECT c.first_name, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
UNION ALL
SELECT a.first_name, a.last_name
FROM actor a
WHERE a.first_name like 'J%' AND a.last_name LIKE 'D%';

-- Same query with UNION will remove the duplicate.
SELECT c.first_name, c.last_name
FROM customer c
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%'
UNION
SELECT a.first_name, a.last_name
FROM actor a
WHERE a.first_name like 'J%' AND a.last_name LIKE 'D%';