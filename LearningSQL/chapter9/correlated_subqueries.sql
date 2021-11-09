/*
A correlated subquery, on the other hand, is dependent on 
its containing statement from which it references one or more columns
*/
SELECT c.first_name, c.last_name
FROM customer c
WHERE 20 = (
    SELECT count(*) FROM rental r 
    WHERE r.customer_id = c.customer_id
);

-- Seen that for myself - can be pretty slow. Can cause performance issues.


-- Range conditions:
SELECT c.first_name, c.last_name
FROM customer c
WHERE (
    SELECT sum(p.amount) FROM payment p
    WHERE p.customer_id = c.customer_id
) BETWEEN 180 AND 240;

