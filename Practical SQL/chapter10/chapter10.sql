CREATE TABLE acs_2011_2015_stats(
    geoid VARCHAR(14) CONSTRAINT geoid_key PRIMARY KEY,
    county VARCHAR(50) NOT NULL,
    st VARCHAR(20) NOT NULL,
    pct_travel_60_min NUMERIC(5,3) NOT NULL,
    pct_bachelors_higher numeric(5,3) NOT NULL,
    pct_masters_higher numeric(5,3) NOT NULL,
    median_hh_income integer,
    CHECK (pct_masters_higher <= pct_bachelors_higher)
);

SELECT * FROM acs_2011_2015_stats;


SELECT avg(median_hh_income) FROM acs_2011_2015_stats WHERE st='Virginia';

-- Listing 10-2
SELECT corr(median_hh_income, pct_bachelors_higher) 
AS bachelors_income_r
FROM acs_2011_2015_stats;

-- Listing 10-3
SELECT round(
      corr(median_hh_income, pct_bachelors_higher)::numeric, 2
      ) AS bachelors_income_r,
    round(
      corr(pct_travel_60_min, median_hh_income)::numeric, 2
      ) AS income_travel_r,
    round(
      corr(pct_travel_60_min, pct_bachelors_higher)::numeric, 2
      ) AS bachelors_travel_r
FROM acs_2011_2015_stats;

-- Listing 10-4

SELECT round(
  regr_slope(median_hh_income, pct_bachelors_higher)::numeric, 2
) AS slope,
  round(
    regr_intercept(median_hh_income, pct_bachelors_higher)::numeric, 2
) AS y_intercept
FROM acs_2011_2015_stats;

-- Listing 10-5
SELECT round(
  regr_r2(median_hh_income,pct_bachelors_higher)::numeric, 3
) AS r_squared
FROM acs_2011_2015_stats;
