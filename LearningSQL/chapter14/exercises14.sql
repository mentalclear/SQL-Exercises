-- Exercise 14-1

CREATE VIEW film_ctgry_actor
AS
SELECT f.title, 
    ct.name category_name, 
    act.first_name, 
    act.last_name
FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category ct
ON fc.category_id = ct.category_id
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
INNER JOIN actor act
ON fa.actor_id = act.actor_id;

SELECT title, category_name, first_name, last_name
FROM film_ctgry_actor
WHERE last_name = 'FAWCETT';

-- Exercise 14.2
CREATE VIEW country_payments
AS
SELECT c.country,
 (SELECT sum(p.amount)
  FROM city ct
   INNER JOIN address a
   ON ct.city_id = a.city_id
   INNER JOIN customer cst
   ON a.address_id = cst.address_id
   INNER JOIN payment p
   ON cst.customer_id = p.customer_id
  WHERE ct.country_id = c.country_id
) tot_payments
FROM country c

SELECT * FROM country_payments;