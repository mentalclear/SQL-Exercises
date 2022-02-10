-- Exercise 10-1

-- Initial
SELECT corr(median_hh_income, pct_bachelors_higher) 
AS bachelors_income_r
FROM acs_2011_2015_stats;

-- New one, resulting 0.568
SELECT corr(median_hh_income, pct_masters_higher) 
AS masters_income_r
FROM acs_2011_2015_stats;

-- Suggested:
SELECT
    round(
      corr(median_hh_income, pct_bachelors_higher)::numeric, 2
      ) AS bachelors_income_r,
    round(
      corr(median_hh_income, pct_masters_higher)::numeric, 2
      ) AS masters_income_r
FROM acs_2011_2015_stats;



-- Exercise 10-2
SELECT
    city,
    st,
    population,
    motor_vehicle_theft,
    round(
        (motor_vehicle_theft::numeric / population) * 100000, 1
        ) AS vehicle_theft_per_100000
FROM fbi_crime_data_2015
WHERE population >= 500000
ORDER BY vehicle_theft_per_100000 DESC;

SELECT
    city,
    st,
    population,
    violent_crime,
    round(
        (violent_crime::numeric / population) * 100000, 1
        ) AS violent_crime_per_100000
FROM fbi_crime_data_2015
WHERE population >= 500000
ORDER BY violent_crime_per_100000 DESC;