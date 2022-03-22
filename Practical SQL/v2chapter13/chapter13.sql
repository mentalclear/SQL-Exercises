/*
    Create a table that I didn't create earlier
*/
CREATE TABLE us_counties_pop_est_2019 (
    state_fips text,
    county_fips text,
    egion smallint,
    state_name text,
    county_name text,
    area_land bigint,
    area_water bigint,
    internal_point_lat numeric(10,7),
    internal_point_lon numeric(10,7),
    pop_est_2018 integer,
    pop_est_2019 integer,
    births_2019 integer,
    deaths_2019 integer,
    international_migr_2019 integer,
    domestic_migr_2019 integer,
    residual_2019 integer,
    CONSTRAINT counties_2019_key PRIMARY KEY (state_fips, county_fips)
);

SELECT * FROM us_counties_pop_est_2019;

-- Listing 13-1
SELECT county_name,
    state_name,
    pop_est_2019
FROM us_counties_pop_est_2019
WHERE pop_est_2019 >= (
    SELECT percentile_cont(.9) WITHIN GROUP (ORDER BY pop_est_2019)
    FROM us_counties_pop_est_2019
    )
ORDER BY pop_est_2019 DESC;

-- Listing 13-2 - Using a Subquery to Identify Rows to Delete
CREATE TABLE us_counties_2019_top10 AS
SELECT * FROM us_counties_pop_est_2019;

SELECT * FROM us_counties_2019_top10;

DELETE FROM us_counties_2019_top10
WHERE pop_est_2019 < (
    SELECT percentile_cont(.9) WITHIN GROUP (ORDER BY pop_est_2019)
    FROM us_counties_2019_top10
);


-- Listing 13-3
SELECT round(calcs.average, 0) AS average,
       calcs.median,
       round(calcs.average - calcs.median, 0) AS median_average_diff
FROM (
    SELECT avg(pop_est_2019) AS average,
            percentile_cont(.5)
                WITHIN GROUP (ORDER BY pop_est_2019)::numeric AS median
     FROM us_counties_pop_est_2019
     )
AS calcs;

-- Listing 13-4

SELECT census.state_name AS st,
       census.pop_est_2018,
       est.establishment_count,
       round((est.establishment_count/census.pop_est_2018::numeric) * 1000, 1)
           AS estabs_per_thousand
FROM
    (
        SELECT st,
               sum(establishments) AS establishment_count
        FROM cbp_naics_72_establishments
        GROUP BY st
    )
    AS est
JOIN
    (
        SELECT state_name,
               sum(pop_est_2018) AS pop_est_2018
        FROM us_counties_pop_est_2019
        GROUP BY state_name
    )
    AS census
ON est.st = census.state_name
ORDER BY estabs_per_thousand DESC;



-- Listing 13-5
SELECT county_name,
       state_name AS st,
       pop_est_2019,
       (SELECT percentile_cont(.5) WITHIN GROUP (ORDER BY pop_est_2019)
        FROM us_counties_pop_est_2019) AS us_median
FROM us_counties_pop_est_2019;

-- Listing 13-6

SELECT county_name,
       state_name AS st,
       pop_est_2019,
       pop_est_2019 - (SELECT percentile_cont(.5) WITHIN GROUP (ORDER BY pop_est_2019) 
                       FROM us_counties_pop_est_2019) AS diff_from_median
FROM us_counties_pop_est_2019
WHERE (pop_est_2019 - (SELECT percentile_cont(.5) WITHIN GROUP (ORDER BY pop_est_2019) 
                       FROM us_counties_pop_est_2019))
       BETWEEN -1000 AND 1000;


-- Listing 13-7 Understanding Subquery Expressions

CREATE TABLE retirees (
    id int,
    first_name text,
    last_name text
);

INSERT INTO retirees
VALUES (2, 'Janet', 'King'),
       (4, 'Michael', 'Taylor');

SELECT * FROM retirees;


-- Prep for listing 13-8
CREATE TABLE departments (
    dept_id integer,
    dept text,
    city text,
    CONSTRAINT dept_key PRIMARY KEY (dept_id),
    CONSTRAINT dept_city_unique UNIQUE (dept, city)
);

INSERT INTO departments
VALUES
    (1, 'Tax', 'Atlanta'),
    (2, 'IT', 'Boston');

CREATE TABLE employees (
    emp_id integer,
    first_name text,
    last_name text,
    salary numeric(10,2),
    dept_id integer REFERENCES departments (dept_id),
    CONSTRAINT emp_key PRIMARY KEY (emp_id)
);

INSERT INTO employees
VALUES
    (1, 'Julia', 'Reyes', 115300, 1),
    (2, 'Janet', 'King', 98000, 1),
    (3, 'Arthur', 'Pappas', 72700, 2),
    (4, 'Michael', 'Taylor', 89500, 2);

-- Listing 13-8 Generating Values for the IN Operator

SELECT first_name, last_name
FROM employees
WHERE emp_id IN (
    SELECT id
    FROM retirees)
ORDER BY emp_id;

-- Listing 13-9  Checking Whether Values Exist

SELECT first_name, last_name
FROM employees
WHERE EXISTS (
    SELECT id
    FROM retirees
    WHERE id = employees.emp_id);

-- Listing 13-10 NOT EXISTS

SELECT first_name, last_name
FROM employees
WHERE NOT EXISTS (
    SELECT id
    FROM retirees
    WHERE id = employees.emp_id);

-- Listing 13-11 LATERAL with FROM

SELECT county_name,
       state_name,
       pop_est_2018,
       pop_est_2019,
       raw_chg,
       round(pct_chg * 100, 2) AS pct_chg
FROM us_counties_pop_est_2019,
    LATERAL (SELECT pop_est_2019 - pop_est_2018 AS raw_chg) rc,
    LATERAL (SELECT raw_chg / pop_est_2018::numeric AS pct_chg) pc
ORDER BY pct_chg DESC;

-- Listing 13-12 LATERAL with JOIN

ALTER TABLE teachers ADD CONSTRAINT id_key PRIMARY KEY (id);

CREATE TABLE teachers_lab_access (
    access_id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    access_time timestamp with time zone,
    lab_name text,
    teacher_id bigint REFERENCES teachers (id)
);

INSERT INTO teachers_lab_access (access_time, lab_name, teacher_id)
VALUES ('2022-11-30 08:59:00-05', 'Science A', 2),
       ('2022-12-01 08:58:00-05', 'Chemistry B', 2),
       ('2022-12-21 09:01:00-05', 'Chemistry A', 2),
       ('2022-12-02 11:01:00-05', 'Science B', 6),
       ('2022-12-07 10:02:00-05', 'Science A', 6),
       ('2022-12-17 16:00:00-05', 'Science B', 6);

SELECT t.first_name, t.last_name, a.access_time, a.lab_name
FROM teachers t
LEFT JOIN LATERAL (SELECT *
                   FROM teachers_lab_access
                   WHERE teacher_id = t.id
                   ORDER BY access_time DESC
                   LIMIT 2) a
ON true
ORDER BY t.id;

-- Listing 13-13 Using Common Table Expressions(CTE)
-- This creates a temporary table from the subquery
WITH large_counties (county_name, state_name, pop_est_2019)
AS (
    SELECT county_name, state_name, pop_est_2019
    FROM us_counties_pop_est_2019
    WHERE pop_est_2019 >= 100000
   )
SELECT state_name, count(*)
FROM large_counties
GROUP BY state_name
ORDER BY count(*) DESC;

-- Listing 13-14

-- Source query
SELECT census.state_name AS st,
       census.pop_est_2018,
       est.establishment_count,
       round((est.establishment_count/census.pop_est_2018::numeric) * 1000, 1)
           AS estabs_per_thousand
FROM (  SELECT st,
               sum(establishments) AS establishment_count
        FROM cbp_naics_72_establishments
        GROUP BY st )
    AS est
JOIN (  SELECT state_name,
               sum(pop_est_2018) AS pop_est_2018
        FROM us_counties_pop_est_2019
        GROUP BY state_name )
    AS census
ON est.st = census.state_name
ORDER BY estabs_per_thousand DESC;

-- Rewritten using CTE
WITH 
    counties (st, pop_est_2018) AS
    (SELECT state_name, sum(pop_est_2018)
     FROM us_counties_pop_est_2019
     GROUP BY state_name),
    establishments (st, establishment_count) AS
    (SELECT st, sum(establishments) AS establishment_count
     FROM cbp_naics_72_establishments
     GROUP BY st)
SELECT counties.st,
       pop_est_2018,
       establishment_count,
       round((establishments.establishment_count /
              counties.pop_est_2018::numeric(10,1)) * 1000, 1)
           AS estabs_per_thousand
FROM counties JOIN establishments
ON counties.st = establishments.st
ORDER BY estabs_per_thousand DESC;           

-- Listing 13-15 Using CTE to minimize redundant code
-- Source 13-6
SELECT county_name,
       state_name AS st,
       pop_est_2019,
       pop_est_2019 - (SELECT percentile_cont(.5) WITHIN GROUP (ORDER BY pop_est_2019) 
                       FROM us_counties_pop_est_2019) AS diff_from_median
FROM us_counties_pop_est_2019
WHERE (pop_est_2019 - (SELECT percentile_cont(.5) WITHIN GROUP (ORDER BY pop_est_2019) 
                       FROM us_counties_pop_est_2019))
       BETWEEN -1000 AND 1000;

-- New query:
WITH us_median AS
    (
        SELECT percentile_cont(.5) 
        WITHIN GROUP (ORDER BY pop_est_2019) AS us_median_pop
        FROM us_counties_pop_est_2019
    )
SELECT county_name,
       state_name AS st,
       pop_est_2019,
       us_median_pop,
       pop_est_2019 - us_median_pop AS diff_from_median
FROM us_counties_pop_est_2019 CROSS JOIN us_median
WHERE (pop_est_2019 - us_median_pop)
        BETWEEN -1000 AND 1000;

-- Listing 13-16 Tabulating Survey Results

CREATE TABLE ice_cream_survey (
    response_id integer PRIMARY KEY,
    office text,
    flavor text
);

-- Import from file:
COPY ice_cream_survey
FROM '/home/dimm/ice_cream_survey.csv'
WITH (FORMAT CSV, HEADER);

SELECT * 
FROM ice_cream_survey
ORDER BY response_id
LIMIT 5;

-- Listing 13-17

SELECT *
FROM crosstab('SELECT office,
                    flavor,
                    count(*)
                FROM ice_cream_survey
                GROUP BY office, flavor
                ORDER BY office', 
                
                'SELECT flavor
                FROM ice_cream_survey
                GROUP BY flavor
                ORDER BY flavor')
AS (office TEXT,
    chocolate BIGINT,
    strawberry BIGINT,
    vanilla BIGINT);

