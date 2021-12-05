-- Exercise 13-1
ALTER TABLE rental
ADD CONSTRAINT fk_rental_customer_id FOREIGN KEY (customer_id)
REFERENCES customer (customer_id) ON DELETE RESTRICT;

-- Exercise 13-2
SELECT customer_id, payment_date, amount
FROM payment
WHERE payment_date > cast('2019-12-31 23:59:59' as datetime);

SELECT customer_id, payment_date, amount
FROM payment
​WHERE payment_date > cast('2019-12-31 23:59:59' as datetime)
  AND amount < 5;
  
CREATE INDEX idx_payment01 
ON payment (payment_date, amount);