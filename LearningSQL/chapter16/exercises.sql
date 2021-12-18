-- Exercise 16-1

SELECT year_no, month_no, tot_sales,
  rank() over (order by tot_sales desc) sales_rank
FROM sales;