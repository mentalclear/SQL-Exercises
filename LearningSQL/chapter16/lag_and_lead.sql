SELECT yearweek(payment_date) payment_week,
  sum(amount) week_total,
  lag(sum(amount), 1)
    over (order by yearweek(payment_date)) prev_wk_tot,
  lead(sum(amount), 1)
    over (order by yearweek(payment_date)) next_wk_tot
FROM payment
GROUP BY yearweek(payment_date)
ORDER BY 1;

SELECT yearweek(payment_date) payment_week,
  sum(amount) week_total,
  round((sum(amount) - lag(sum(amount), 1)
    over (order by yearweek(payment_date)))
    / lag(sum(amount), 1)
      over (order by yearweek(payment_date))
    * 100, 1) pct_diff
FROM payment
GROUP BY yearweek(payment_date)
ORDER BY 1;

