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