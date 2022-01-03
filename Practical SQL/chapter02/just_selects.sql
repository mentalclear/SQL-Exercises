SELECT * FROM teachers;

-- Refined SELECT only those that are needed:
SELECT last_name, first_name, salary FROM teachers;

-- Distinct, selecting without duplicates.
SELECT DISTINCT school FROM "teachers";

SELECT DISTINCT school, salary FROM "teachers";

-- Order 
SELECT first_name, last_name, salary 
FROM teachers 
ORDER BY salary DESC;

SELECT last_name, school, hire_date
FROM teachers 
ORDER BY school ASC, hire_date DESC;

-- WHERE
SELECT last_name, school, hire_date
FROM teachers 
WHERE school LIKE 'M%';

SELECT first_name, last_name, school
FROM teachers
WHERE first_name = 'Janet';

SELECT school
FROM teachers
WHERE school != 'F.D. Roosevelt HS';

SELECT first_name, last_name, school, salary
FROM teachers
WHERE salary BETWEEN 40000 AND 65000;