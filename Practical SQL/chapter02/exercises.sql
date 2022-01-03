
-- Exericse 2-1

SELECT school, first_name, last_name
FROM teachers 
ORDER BY school ASC, last_name ASC;

-- Exericse 2-2
SELECT first_name, salary
FROM teachers 
WHERE first_name LIKE 'S%' 
AND salary > 40000;

-- Exericse 2-3
SELECT first_name, last_name, hire_date, salary
FROM teachers 
WHERE hire_date > '2010-01-01'
ORDER BY salary DESC;


-- Just to check if all is good:
SELECT first_name, last_name, hire_date, salary
FROM teachers
ORDER BY salary DESC;