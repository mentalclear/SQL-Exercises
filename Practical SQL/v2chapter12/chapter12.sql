-- Listing 12-1

SELECT
  date_part('year', '2022-12-01 18:37:12 EST'::timestamptz) AS year,
  date_part('month', '2022-12-01 18:37:12 EST'::timestamptz) AS month,
  date_part('day', '2022-12-01 18:37:12 EST'::timestamptz) AS day,
  date_part('hour', '2022-12-01 18:37:12 EST'::timestamptz) AS hour,
  date_part('minute', '2022-12-01 18:37:12 EST'::timestamptz) AS minute,
  date_part('seconds', '2022-12-01 18:37:12 EST'::timestamptz) AS seconds,
  date_part('timezone_hour', '2022-12-01 18:37:12 EST'::timestamptz) AS tz,
  date_part('week', '2022-12-01 18:37:12 EST'::timestamptz) AS week,
  date_part('quarter', '2022-12-01 18:37:12 EST'::timestamptz) AS quarter,
  date_part('epoch', '2022-12-01 18:37:12 EST'::timestamptz) AS epoch;

SELECT
  extract(year from '2022-12-01 18:37:12 EST'::timestamptz) AS year;

-- Listing 12-2
SELECT make_date(2022,2,22);
SELECT make_time(18, 4, 30.3);
SELECT make_timestamptz(2022, 2, 22, 18, 4, 30.3, 'Europe/Lisbon');

-- Listing 12-3
CREATE TABLE current_time_example (
    time_id INTEGER GENERATED ALWAYS AS IDENTITY,
    current_timestamp_col timestamptz,
    clock_timestamp_col timestamptz
);

INSERT INTO current_time_example
            (current_timestamp_col, clock_timestamp_col)
   (SELECT current_timestamp,
            clock_timestamp()
     FROM generate_series(1,1000));

SELECT * FROM current_time_example;