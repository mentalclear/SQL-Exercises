SELECT monthname(payment_date) payment_month,
 amount,
 sum(amount) 
     over (partition by monthname(payment_date)) monthly_total,
sum(amount) over () grand_total
FROM payment
WHERE amount >= 10
ORDER BY 1;


SELECT monthname(payment_date) payment_month,
   sum(amount) month_total,
   round(sum(amount) / sum(sum(amount)) over ()
     * 100, 2) pct_of_total
 FROM payment
 GROUP BY monthname(payment_date);

 SELECT monthname(payment_date) payment_month,
  sum(amount) month_total,
  CASE sum(amount)
    WHEN max(sum(amount)) over () THEN 'Highest'
    WHEN min(sum(amount)) over () THEN 'Lowest'
    ELSE 'Middle'
  END descriptor
FROM payment
GROUP BY monthname(payment_date);