SHOW timezone;
SELECT current_setting('timezone');

/*  SHOW ALL to see all settings! */
SHOW ALL;

-- Use current_setting as an input for other function   
SELECT make_timestamptz(2022, 2, 22, 18, 4, 30.3, current_setting('timezone'));

-- Listing 12-5
SELECT * FROM pg_timezone_abbrevs ORDER BY abbrev;
SELECT * FROM pg_timezone_names ORDER BY name;

SELECT * FROM pg_timezone_names
WHERE name LIKE 'Europe%'
ORDER BY name;

-- Listing 12-6
SET TIME ZONE 'US/Pacific';

CREATE TABLE time_zone_test (
    test_date timestamptz
);

INSERT INTO time_zone_test VALUES ('2023-01-01 4:00');

SELECT test_date
FROM time_zone_test;

SET TIME ZONE 'US/Eastern';

SELECT test_date AT TIME ZONE 'Asia/Seoul'
FROM time_zone_test;