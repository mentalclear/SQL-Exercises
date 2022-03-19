-- Chapter 12 ex 1

SELECT
    trip_id,
    tpep_pickup_datetime,
    tpep_dropoff_datetime,
    tpep_dropoff_datetime - tpep_pickup_datetime AS length_of_ride
FROM nyc_yellow_taxi_trips
ORDER BY length_of_ride DESC;

-- Chapter 12 ex 2

-- Gettin TimeZone names
SELECT * FROM pg_timezone_names
WHERE name LIKE '%Mel%'
ORDER BY name;

-- The exercise
SELECT 
    '2100-01-01 00:00:00-05' AT TIME ZONE 'US/Eastern' AS new_york,
    '2100-01-01 00:00:00-05' AT TIME ZONE 'Europe/London' AS london,
    '2100-01-01 00:00:00-05' AT TIME ZONE 'Africa/Johannesburg' AS johannesburg,
    '2100-01-01 00:00:00-05' AT TIME ZONE 'Europe/Moscow' AS moscow,
    '2100-01-01 00:00:00-05' AT TIME ZONE 'Australia/Melbourne' AS melburn;
    
-- Chapter 12 ex 3
SELECT
    round(
          corr(total_amount, (
              date_part('epoch', tpep_dropoff_datetime) -
              date_part('epoch', tpep_pickup_datetime)
                ))::numeric, 2
          ) AS amount_time_corr,
    round(
        regr_r2(total_amount, (
              date_part('epoch', tpep_dropoff_datetime) -
              date_part('epoch', tpep_pickup_datetime)
        ))::numeric, 2
    ) AS amount_time_r2,
    round(
          corr(total_amount, trip_distance)::numeric, 2
          ) AS amount_distance_corr,
    round(
        regr_r2(total_amount, trip_distance)::numeric, 2
    ) AS amount_distance_r2
FROM nyc_yellow_taxi_trips
WHERE tpep_dropoff_datetime - tpep_pickup_datetime <= '3 hours'::interval;


