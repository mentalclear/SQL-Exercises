SELECT a.first_name as fname, a.last_name as lname
FROM actor a
WHERE a.last_name LIKE 'L%'
UNION
SELECT c.first_name as fname, c.last_name as lname
FROM customer c
WHERE c.last_name LIKE 'L%';
