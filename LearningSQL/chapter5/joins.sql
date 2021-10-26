-- Cartesian product. Actually doesn't work for me.
SELECT c.first_name, c.last_name, a.address
FROM customer c 
JOIN address a;


-- My Version. And also inner joins from the book.
SELECT c.first_name, c.last_name, a.address
FROM customer c
JOIN address a 
ON c.address_id = a.address_id;

-- Subclause example
SELECT c.first_name, c.last_name, a.address
FROM customer c
INNER JOIN address a 
USING (address_id);

-- ANSI syntax(older way):
SELECT c.first_name, c.last_name, a.address
FROM customer c, address a 
WHERE c.address_id = a.address_id;

-- Returning only customer with post code 52137 ANSI syntax:
SELECT c.first_name, c.last_name, a.address
FROM customer c, address a 
WHERE c.address_id = a.address_id
AND a.postal_code = '52137';

-- Same with JOINS
SELECT c.first_name, c.last_name, a.address
FROM customer c 
JOIN address a 
ON c.address_id = a.address_id
WHERE a.postal_code = '52137';

-- Join three tables:
SELECT c.first_name, c.last_name, a.address, ct.city
FROM customer c 
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city ct
ON a.city_id = ct.city_id;
 
--Straight JOIN  -MySQL Specific
SELECT STRAIGHT_JOIN c.first_name, c.last_name, ct.city
FROM city ct
  INNER JOIN address a
  ON a.city_id = ct.city_id
  INNER JOIN customer c
  ON c.address_id = a.address_id;