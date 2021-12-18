SELECT quarter(payment_date) quarter,
   monthname(payment_date) month_nm,
   sum(amount) monthly_sales,
   rank() over (order by sum(amount) desc) sales_rank
 FROM payment
 WHERE year(payment_date) = 2005
 GROUP BY quarter(payment_date), monthname(payment_date)
 ORDER BY 1,2;


-- Actually will not work in my version of MySQL.
SELECT quarter(payment_date) quarter,
    monthname(payment_date) month_nm,
    sum(amount) monthly_sales,
    rank() over (partition by quarter(payment_date) 
    order by sum(amount) desc) qtr_sales_rank
FROM payment
WHERE year(payment_date) = 2005
GROUP BY quarter(payment_date), monthname(payment_date)
ORDER BY 1, month(payment_date);