SELECT 'Small Fry' name, 0 low_limit, 74.99 high_limit
UNION ALL
SELECT 'Average Joes' name, 75 low_limit, 149.99 high_limit
UNION ALL 
SELECT 'Heavy Hitters' name, 150 low_limit, 9999999.99 high_limit;


-- This one doesn't work!
SELECT pymnt_grps.name, count(*) num_customers
FROM
(SELECT customer_id,
    count(*) num_rentals, sum(amount) tot_payments
  FROM payment
  GROUP BY customer_id
) pymnt
  INNER JOIN
(SELECT 'Small Fry' name, 0 low_limit, 74.99 high_limit
  UNION ALL
  SELECT 'Average Joes' name, 75 low_limit, 149.99 high_limit
  UNION ALL
  SELECT 'Heavy Hitters' name, 150 low_limit, 9999999.99 high_limit
) pymnt_grps
  ON pymnt.tot_payments
    BETWEEN pymnt_grps.low_limit AND pymnt_grps.high_limit
GROUP BY pymnt_grps.name;