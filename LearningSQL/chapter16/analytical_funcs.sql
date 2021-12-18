SELECT extract(quarter from payment_date) as quarter,
TO_CHAR(payment_date, 'Month') as month_nm,
sum(amount) monthly_sales
FROM payment
WHERE extract(year from payment_date) = 2005
GROUP BY quarter, month_nm;