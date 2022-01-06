-- Exercise 5.1
SELECT 3.14 * (5 ^ 2) AS "Area of a circle";

-- Exercise 5.2
SELECT geo_name,
    state_us_abbreviation AS "st",   
    p0010001 AS total_population, 
    p0010005 AS "Am Indian/Alaska Native Alone",
    (CAST (p0010005 AS numeric(8,1)) / p0010001) * 100
           AS percent_american_indian_alaska_native_alone
FROM us_counties_2010 
WHERE state_us_abbreviation='NY'
ORDER BY percent_american_indian_alaska_native_alone DESC;

-- Exercise 5.3
SELECT percentile_cont(.5)
        WITHIN GROUP (ORDER BY p0010001)
FROM us_counties_2010
WHERE state_us_abbreviation = 'NY';

SELECT percentile_cont(.5)
        WITHIN GROUP (ORDER BY p0010001)
FROM us_counties_2010
WHERE state_us_abbreviation = 'CA';

-- Or both in one query (credit: https://github.com/Kennith-eng)

SELECT state_us_abbreviation,
       percentile_cont(0.5)
          WITHIN GROUP (ORDER BY p0010001) AS median
FROM us_counties_2010
WHERE state_us_abbreviation IN ('NY', 'CA')
GROUP BY state_us_abbreviation;

SELECT state_us_abbreviation,
       percentile_cont(0.5)
          WITHIN GROUP (ORDER BY p0010001) AS median
FROM us_counties_2010
GROUP BY state_us_abbreviation;
