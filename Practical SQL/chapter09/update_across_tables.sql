CREATE TABLE state_regions (
    st varchar(2) CONSTRAINT st_key PRIMARY KEY,
    region varchar(20) NOT NULL
);

SELECT * FROM state_regions;

-- Add inspection date to the meat_poultry_egg_inspect table
ALTER TABLE meat_poultry_egg_inspect ADD COLUMN inspection_date date;

UPDATE meat_poultry_egg_inspect inspect
SET inspection_date = '2019-12-01'
WHERE EXISTS (SELECT state_regions.region
                FROM state_regions
                WHERE inspect.st = state_regions.st
                      AND state_regions.region = 'New England');

-- Checking the result:
SELECT st, inspection_date
FROM meat_poultry_egg_inspect
GROUP BY st, inspection_date
ORDER BY st;                      