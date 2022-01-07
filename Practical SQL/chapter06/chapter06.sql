CREATE TABLE departments (
    dept_id BIGSERIAL,
    dept VARCHAR(100),
    city VARCHAR(100),
    CONSTRAINT dep_key PRIMARY KEY (dept_id),
    CONSTRAINT dept_city_unique UNIQUE (dept, city)
);

CREATE TABLE employees (
    emp_id BIGSERIAL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    salary INTEGER,
    dept_id INTEGER REFERENCES departments(dept_id),
    CONSTRAINT emp_key PRIMARY KEY (emp_id),
    CONSTRAINT emp_dept_unique UNIQUE (emp_id, dept_id)
);
    
INSERT INTO departments (dept, city)
VALUES
    ('Tax', 'Atlanta'),
    ('IT', 'Boston');
    
INSERT INTO employees (first_name, last_name, salary, dept_id)
VALUES
    ('Nancy', 'Jones', 62500, 1),
    ('Lee', 'Smith', 59300, 1),
    ('Soo', 'Nguyen', 83000, 2),
    ('Janet', 'King', 95000, 2);


SELECT * FROM "departments";

SELECT * FROM "employees";

SELECT e.first_name, e.last_name, salary, d.dept, d.city
FROM "employees" e
JOIN "departments" d 
ON e.dept_id = d.dept_id;

-- Switch to analysis database
CREATE TABLE schools_left (
    id integer CONSTRAINT left_id_key PRIMARY KEY,
    left_school varchar(30)
);

DROP  TABLE IF EXISTS schools_left;

CREATE TABLE schools_right (
    id INTEGER CONSTRAINT right_id_key PRIMARY KEY,
    right_school VARCHAR(30)
);

INSERT INTO schools_left (id, left_school) VALUES
    (1, 'Oak Street School'),
    (2, 'Roosevelt High School'),
    (5, 'Washington Middle School'),
    (6, 'Jefferson High School');

SELECT id, left_school FROM schools_left;

INSERT INTO schools_right (id, right_school) VALUES
    (1, 'Oak Street School'),
    (2, 'Roosevelt High School'),
    (3, 'Morrison Elementary'),
    (4, 'Chase Magnet Academy'),
    (6, 'Jefferson High School');

SELECT id, right_school FROM schools_right;    

-- Just a JOIN
SELECT * 
FROM schools_left 
JOIN schools_right
ON schools_left.id = schools_right.id;

-- LEFT AND RIGHT JOIN
SELECT * 
FROM schools_left 
LEFT JOIN schools_right
ON schools_left.id = schools_right.id;

SELECT * 
FROM schools_left 
RIGHT JOIN schools_right
ON schools_left.id = schools_right.id;

-- FULL OUTER JOIN
SELECT *
FROM schools_left FULL OUTER JOIN schools_right
ON schools_left.id = schools_right.id;

SELECT *
FROM schools_left CROSS JOIN schools_right;

-- Find NULL values
SELECT *
FROM schools_left LEFT JOIN schools_right
ON schools_left.id = schools_right.id
WHERE schools_right.id IS NULL;