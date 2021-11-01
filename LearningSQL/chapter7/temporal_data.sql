SELECT timezone('utc', now());

SELECT now()::timestamp;

-- Returns UTC time
SELECT TIMEOFDAY();

-- Timezone info
SHOW timezone;

-- Doesn't work in PostgreSQL
SELECT @@global.time_zone, @@session.time_zone;

-- COnversion string to date, not working in PostgreSQL
SELECT CAST('2019-09-17 15:30:00' AS DATETIME);

SELECT CAST('2019-09-17' AS DATE) date_field,
CAST('108:17:57' AS TIME) time_field;

--Doesn't work in PostgreSQL
SELECT STR_TO_DATE('September 17, 2019', '%M %d, %Y');

--Doesn't work in PostgreSQL
SELECT CURRENT_DATE(), CURRENT_TIME(), CURRENT_TIMESTAMP();

