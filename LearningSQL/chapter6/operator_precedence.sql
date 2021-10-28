SELECT a.first_name fname, a.last_name lname
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'
UNION ALL 
SELECT a.first_name, a.last_name
FROM actor a
WHERE a.first_name LIKE 'M%' AND a.last_name LIKE 'T%'
UNION 
SELECT c.first_name, c.last_name
FROM customer c 
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%';

-- Same query with reversed UNION and UNION ALL

SELECT a.first_name fname, a.last_name lname
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'
UNION
SELECT a.first_name, a.last_name
FROM actor a
WHERE a.first_name LIKE 'M%' AND a.last_name LIKE 'T%'
UNION ALL 
SELECT c.first_name, c.last_name
FROM customer c 
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%';

/* 
Compound queries are evaluated top to bottom, but remember:
   1. The ANSI SQL specification calls for the intersect operator 
      to have precedence over the other set operators.
   2. You may dictate the order in which queries are combined 
      by enclosing multiple queries in parentheses.
*/

-- This form doesn't work in MySQL and PostgreSQL may works somwhere else.
SELECT a.first_name fname, a.last_name lname
FROM actor a
WHERE a.first_name LIKE 'J%' AND a.last_name LIKE 'D%'
UNION
(SELECT a.first_name, a.last_name
FROM actor a
WHERE a.first_name LIKE 'M%' AND a.last_name LIKE 'T%'
UNION ALL 
SELECT c.first_name, c.last_name
FROM customer c 
WHERE c.first_name LIKE 'J%' AND c.last_name LIKE 'D%');
