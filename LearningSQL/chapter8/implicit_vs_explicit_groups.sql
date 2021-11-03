-- The point here is to group by customer ID.
SELECT customer_id,
MAX(amount) max_amt,
  MIN(amount) min_amt,
  AVG(amount) avg_amt,
  SUM(amount) tot_amt,
  COUNT(*) num_payments
FROM payment
GROUP BY customer_id --Will not work without GROUP BY clause
ORDER BY 4 DESC; 
