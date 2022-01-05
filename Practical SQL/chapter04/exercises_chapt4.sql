-- Exercise 4-1
/*
id:movie:actor
50:#Mission:Impossible#:Tom Cruise
*/

COPY movies 
FROM '/tmp/movie.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ':', QUOTE '#');

-- Exercise 4-2
COPY (
    SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent
    FROM us_counties_2010
    ORDER BY housing_unit_count_100_percent DESC
    LIMIT 20) 
TO '/tmp/Top20housing.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ';');
