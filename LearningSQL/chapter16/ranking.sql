-- Returns 2 customers with 42 
SELECT customer_id, COUNT(*) AS num_rentals
FROM rental
GROUP BY customer_id
ORDER BY 2 DESC;



SELECT customer_id, count(*) num_rentals,
  row_number() over (order by count(*) desc) row_number_rnk,
  rank() over (order by count(*) desc) rank_rnk,
  dense_rank() over (order by count(*) desc) dense_rank_rnk
FROM rental
GROUP BY customer_id
ORDER BY 2 desc;

-- Generating Multiple Rankings
SELECT customer_id,
 monthname(rental_date) rental_month,
 count(*) num_rentals
FROM rental
GROUP BY customer_id, monthname(rental_date)
ORDER BY 2, 3 desc;


SELECT customer_id,
 monthname(rental_date) rental_month,
 count(*) num_rentals,
 rank() over (partition by monthname(rental_date)
 order by count(*) desc) rank_rnk
FROM rental
GROUP BY customer_id, monthname(rental_date)
ORDER BY 2, 3 desc;