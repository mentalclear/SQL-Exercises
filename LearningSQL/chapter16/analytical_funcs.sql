SELECT extract(quarter from payment_date) as quarter,
TO_CHAR(payment_date, 'Month') as month_nm,
sum(amount) monthly_sales
FROM payment
WHERE extract(year from payment_date) = 2005
GROUP BY quarter, month_nm;


SELECT quarter(payment_date) quarter,
   monthname(payment_date) month_nm,
   sum(amount) monthly_sales,
   max(sum(amount))
     over () max_overall_sales,
   max(sum(amount))
     over (partition by quarter(payment_date)) max_qrtr_sales
 FROM payment
 WHERE year(payment_date) = 2005
 GROUP BY quarter(payment_date), monthname(payment_date);