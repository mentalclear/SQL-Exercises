SELECT 2 + 2;
SELECT 9 - 1;
SELECt 3 * 4; 


SELECT 11 / 6;
SELECT 11 % 6;
SELECT 11.0 /6;
SELECT CAST(11 AS NUMERIC(3,1)) / 6;


-- Exponents, Roots and Factorials
SELECT 3 ^ 4;
SELECT |/ 10;
SELECT sqrt(10);
SELECT ||/10;
SELECT 4! as "Factorial";

-- Order of operations
SELECT 7 + 8 * 9;
SELECT(7+8)*9;
SELECT 3 ^ 3 - 1;
SELECT 3 ^ (3 - 1);

-- Census math

SELECT geo_name,
    state_us_abbreviation AS "st",
    p0010001 AS "Total Population",
    p0010003 AS "White Alone",
    p0010004 AS "Black or African American Alone",
    p0010005 AS "Am Indian/Alaska Native Alone",
    p0010006 AS "Asian Alone",
    p0010007 AS "Native Hawaiian and Other Pacific Islander Alone",
    p0010008 AS "Some Other Race Alone",
    p0010009 AS "Two or More Races"
FROM us_counties_2010;

--Adding and Subtracting columns
SELECT geo_name,
         state_us_abbreviation AS "st",
         p0010003 AS "White Alone",
         p0010004 AS "Black Alone",
         p0010003 + p0010004 AS "Total White and Black"
  FROM us_counties_2010;

-- Census totals checking

SELECT geo_name,
         state_us_abbreviation AS "st",
         p0010001 AS "Total",
         p0010003 + p0010004 + p0010005 + p0010006 + p0010007
              + p0010008 + p0010009 AS "All Races",
        (p0010003 + p0010004 + p0010005 + p0010006 + p0010007
              + p0010008 + p0010009) - p0010001 AS "Difference"
FROM us_counties_2010
ORDER BY "Difference" DESC;

-- Finding Percentages of the Whole
SELECT geo_name, state_us_abbreviation AS "st",
         (CAST(p0010006 AS NUMERIC(8,1))/p0010001)*100 AS "pct_asian"
FROM us_counties_2010
ORDER BY "pct_asian" DESC;

-- Tracking Percent Change
CREATE TABLE percent_change (
      department varchar(20),
      spend_2014 numeric(10,2),
      spend_2017 numeric(10,2)
  );
INSERT INTO percent_change
  VALUES
      ('Building', 250000, 289000),
      ('Assessor', 178556, 179500),
      ('Library', 87777, 90001),
      ('Clerk', 451980, 650000),
      ('Police', 250000, 223000),
      ('Recreation', 199000, 195000);

SELECT department,
         spend_2014,
         spend_2017,
         round( (spend_2017 - spend_2014) /
                      spend_2014 * 100, 1) AS "pct_change"
  FROM percent_change;

--Aggregate Functions for Averages and Sums
SELECT sum(p0010001) AS "County Sum",
round(avg(p0010001), 0) AS "County Average"
FROM "us_counties_2010";

-- Medians
CREATE Table percentile_test (
    numbers INTEGER
);

INSERT INTO percentile_test(numbers)
VALUES (1),(2),(3),(4),(5),(6);

SELECT percentile_cont(.5)
WITHIN GROUP (ORDER BY numbers),
percentile_disc(.5)
WITHIN GROUP (ORDER BY numbers)
FROM percentile_test;

-- Median and Percentile data in census
SELECT sum(p0010001) AS "County Sum",
       round(avg(p0010001), 0) AS "County Average",
       percentile_cont(.5)
       WITHIN GROUP (ORDER BY p0010001) AS "County Median"
FROM us_counties_2010;

-- Arrays
SELECT unnest(
            percentile_cont(array[.25,.5,.75])
            WITHIN GROUP (ORDER BY p0010001)
            ) AS "quartiles"
FROM us_counties_2010;

-- Finding the Mode
SELECT mode() WITHIN GROUP (ORDER BY p0010001)
FROM us_counties_2010;