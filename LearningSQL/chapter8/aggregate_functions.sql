/*
max()
Returns the maximum value within a set

min()
Returns the minimum value within a set

avg()
Returns the average value across a set

sum()
Returns the sum of the values across a set

count()
Returns the number of values in a set
*/

SELECT MAX(amount) max_amt,
MIN(amount) min_amount,
AVG(amount) avg_amount,
SUM(amount) sum_amount,
COUNT(*) num_payments
FROM payment;