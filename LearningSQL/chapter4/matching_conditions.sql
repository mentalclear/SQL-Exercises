-- Strip off first letter with left()
SELECT last_name, first_name
FROM customer
WHERE left(last_name, 1) = 'Q';

-- Wildcards _ single and % multiple
SELECT last_name, first_name
FROM customer
WHERE last_name LIKE '_A_T%S';

-- Using multiple search expressions:
SELECT last_name, first_name
FROM customer
WHERE last_name LIKE 'Q%' OR last_name LIKE 'Y%';


-- Using Regular expressions | Tilde is used in PostgreSQL
SELECT last_name, first_name
FROM customer
WHERE last_name ~ '^[QY]';