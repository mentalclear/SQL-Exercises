SELECT yearweek(payment_date) payment_week,
  sum(amount) week_total,
  sum(sum(amount))
    over (order by yearweek(payment_date)
      rows unbounded preceding) rolling_sum
FROM payment
GROUP BY yearweek(payment_date)
ORDER BY 1;


SELECT yearweek(payment_date) payment_week,
  sum(amount) week_total,
  avg(sum(amount))
    over (order by yearweek(payment_date)
      rows between 1 preceding and 1 following) rolling_3wk_avg
FROM payment
GROUP BY yearweek(payment_date)
ORDER BY 1;

SELECT date(payment_date), sum(amount),
  avg(sum(amount)) over (order by date(payment_date)
    range between interval 3 day preceding
      and interval 3 day following) 7_day_avg
FROM payment
WHERE payment_date BETWEEN '2005-07-01' AND '2005-09-01'
GROUP BY date(payment_date)
ORDER BY 1;

