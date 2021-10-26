SELECT concat(cust.last_name, ', ', cust.first_name) full_name
FROM (
    SELECT first_name, last_name, email
	FROM customer
	WHERE first_name = 'JESSIE'
    )
cust;