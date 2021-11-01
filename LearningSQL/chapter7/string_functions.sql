DELETE FROM string_tbl;

SELECT * from string_tbl;

INSERT INTO string_tbl (text_fld)
VALUES ('This string was 29 characters');

UPDATE string_tbl
SET text_fld = text_fld || 'but now it is longer';


-- Switch to sakila here
SELECT concat(first_name, ' ', last_name,
' has been a customer since ', date(create_date)) cust_narrative
FROM customer;