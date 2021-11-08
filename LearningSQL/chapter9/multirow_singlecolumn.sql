SELECT country_id 
FROM country
WHERE country IN ('Canada', 'Mexico');

-- Equals to:
SELECT country_id
FROM country
WHERE country = 'Canada' OR country = 'Mexico';

-- Returning all cities that are in Canada or Mexico
SELECT city_id, city
FROM city
WHERE country_id IN 
(
    SELECT country_id 
    FROM country
    WHERE country IN ('Canada', 'Mexico')
);

-- Same idea with Not IN
SELECT city_id, city
FROM city
WHERE country_id NOT IN 
(
    SELECT country_id 
    FROM country
    WHERE country IN ('Canada', 'Mexico')
);

-- All operator, that's a weird looking query
SELECT first_name, last_name
FROM customer 
WHERE customer_id <> ALL
(
    SELECT customer_id
    FROM payment
    WHERE amount = 0
);


-- Same result but better and faster.
SELECT first_name, last_name
FROM customer
WHERE customer_id NOT IN
(
    SELECT customer_id
    FROM payment
    WHERE amount = 0
);

-- With Having clause
SELECT customer_id, count(*)
FROM rental
GROUP BY customer_id
    HAVING count(*) > ALL (
    SELECT count(*)
    FROM rental r
    JOIN customer c 
    ON r.customer_id = c.customer_id
    JOIN address a
    ON c.address_id = a.address_id
    INNER JOIN city ct
    ON a.city_id = ct.city_id
    INNER JOIN country co
    ON ct.country_id = co.country_id
    WHERE co.country IN ('United States','Mexico','Canada')
    GROUP BY r.customer_id
);

--Any
/*
This example will find all customers whose total film rental 
payments exceed the total payments for all customers in Bolivia, 
Paraguay, or Chile
*/
SELECT customer_id, sum(amount)
FROM payment
GROUP BY customer_id
HAVING sum(amount) > ANY
(SELECT sum(p.amount)
    FROM payment p
    INNER JOIN customer c
    ON p.customer_id = c.customer_id
    INNER JOIN address a
    ON c.address_id = a.address_id
    INNER JOIN city ct
    ON a.city_id = ct.city_id
    INNER JOIN country co
    ON ct.country_id = co.country_id
    WHERE co.country IN ('Bolivia','Paraguay','Chile')
    GROUP BY co.country
);