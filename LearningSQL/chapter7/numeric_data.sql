SELECT (37 * 59) / (78 -(8*6));

SELECT MOD(10,4);

SELECT 10%4;

SELECT POW(2, 8);

-- Giving double precision
SELECT POW(2,10) kilobyte, POW(2,20) megabyte,
POW(2,30) gigabyte, POW(2,40) terabyte;

-- Controling number precision:
SELECT CEIL(72.445), FLOOR(72.445);
SELECT CEIL(72.000000001), FLOOR(72.999999999);
SELECT ROUND(72.49999), ROUND(72.5), ROUND(72.50001);

-- Precision example:
SELECT ROUND(72.0909, 1), ROUND(72.0909, 2), ROUND(72.0909, 3);

-- Will not work in the PostgreSQL
SELECT TRUNCATE(72.0909, 1), TRUNCATE(72.0909, 2),
TRUNCATE(72.0909, 3);

