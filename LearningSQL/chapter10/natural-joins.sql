SELECT c.first_name, c.last_name, date(r.rental_date)
FROM customer c
NATURAL JOIN rental r;

SELECT cust.first_name, cust.last_name, date(r.rental_date)
FROM
(SELECT customer_id, first_name, last_name
 FROM customer
) cust
 NATURAL JOIN rental r;