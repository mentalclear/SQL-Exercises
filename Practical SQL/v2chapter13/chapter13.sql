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