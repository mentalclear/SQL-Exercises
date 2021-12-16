-- Example 1
SET @qry = 'SELECT customer_id, first_name, last_name FROM customer';

PREPARE dynsql1 FROM @qry;

EXECUTE dynsql1;


-- Example 2
SET @qry = 'SELECT customer_id, first_name, last_name 
FROM customer WHERE customer_id = ?';
PREPARE dynsql2 FROM @qry;

SET @custid = 9;
EXECUTE dynsql2 USING @custid;

SET @custid = 145;

EXECUTE dynsql2 USING @custid;

DEALLOCATE PREPARE dynsql2;