-- Use Analysis database
CREATE TABLE meat_poultry_egg_inspect (
    est_number varchar(50) CONSTRAINT est_number_key PRIMARY KEY,
    company varchar(100),
    street varchar(100),
    city varchar(30),
    st varchar(2),
    zip varchar(5),
    phone varchar(14),
    grant_date date,
    activities text,
    dbas text
);

-- Make sure to copy .CSV

-- Create an idex
CREATE INDEX company_idx ON meat_poultry_egg_inspect (company);

SELECT count(*) FROM meat_poultry_egg_inspect;

-- Collectin info from the DATABASE
-- Finding multiple companies at the same address

SELECT company,
    street,
    city,
    st,
    count(*) AS address_count
FROM meat_poultry_egg_inspect
GROUP BY company, street, city, st
HAVING count(*) > 1
ORDER BY company, street, city, st;

--Checking for missing values:
SELECT st,
       count(*) AS st_count
FROM meat_poultry_egg_inspect
GROUP BY st
ORDER BY st;

-- Checking why there are NULL values:
SELECT est_number,
       company,
       city,
       st,
       zip
FROM meat_poultry_egg_inspect
WHERE st IS NULL;

-- Checking Inconsistent Data Values:
SELECT company, count(*) AS company_count
FROM meat_poultry_egg_inspect
--WHERE company LIKE 'Arm%' reveals same co with diff names
GROUP BY company
ORDER BY company ASC;


-- Checking malformed vlues using length():
SELECT length(zip),
    count(*) AS length_count
FROM meat_poultry_egg_inspect
GROUP BY length(zip)
ORDER BY length(zip) ASC;

-- Some zipcodes were truncated when .csv was imported. Leading 00's were removed.

SELECT st, count(*) AS st_count
FROM meat_poultry_egg_inspect
WHERE length(zip) < 5
GROUP BY st
ORDER BY st ASC;

-- Items to correct in the dataset:
-- 1. Missing values for three rows in the st column
-- 2. Inconsistent spelling of at least one company’s name
-- 3. Inaccurate ZIP Codes due to file conversion

-- Fixing those issues will be done below.

-- ALTER TABLE is used to modify table's structure. Examples
/*
ALTER TABLE table ADD COLUMN column data_type;
ALTER TABLE table DROP COLUMN column;
ALTER TABLE table ALTER COLUMN column SET DATA TYPE data_type;
ALTER TABLE table ALTER COLUMN column SET NOT NULL;
ALTER TABLE table ALTER COLUMN column DROP NOT NULL;
*/

-- UPDATE TABLE is used to modify the data in the table. Examples:
/*
UPDATE table
SET column_a = value,
    column_b = value;

UPDATE table
SET column = value
WHERE criteria;

UPDATE table
SET column = (SELECT column
              FROM table_b
              WHERE table.column = table_b.column)
WHERE EXISTS (SELECT column
              FROM table_b
              WHERE table.column = table_b.column);
*/

-- BACKUP!!! Great idea! Backup tables! (I would usually just backup DB)
CREATE TABLE meat_poultry_egg_inspect_backup 
AS SELECT * FROM meat_poultry_egg_inspect;

-- Confiriming the copy is consistent:
SELECT
    (SELECT count(*) FROM meat_poultry_egg_inspect) AS original,
    (SELECT count(*) FROM meat_poultry_egg_inspect_backup) AS backup;


-- Create a copy of a column
ALTER TABLE meat_poultry_egg_inspect ADD COLUMN st_copy varchar(2);

UPDATE meat_poultry_egg_inspect
SET st_copy = st;

-- Check if results are the same:
SELECT st,
    st_copy
FROM meat_poultry_egg_inspect
ORDER BY st;

UPDATE meat_poultry_egg_inspect
  SET st = 'MN'
WHERE est_number = 'V18677A';

UPDATE meat_poultry_egg_inspect
  SET st = 'AL'
WHERE est_number = 'M45319+P45319';

UPDATE meat_poultry_egg_inspect
  SET st = 'WI'
WHERE est_number = 'M263A+P263A+V263A';

-- Testing if we are good now:
SELECT est_number,
       company,
       city,
       st,
       zip
FROM meat_poultry_egg_inspect
WHERE st IS NULL;

-- Updating values for consistency
ALTER TABLE meat_poultry_egg_inspect
ADD COLUMN company_standard VARCHAR(100);

-- Copy the company data to the new column created above:
UPDATE meat_poultry_egg_inspect
SET company_standard = company;

SELECT company, company_standard 
FROM meat_poultry_egg_inspect
WHERE company LIKE 'Armour%';

UPDATE meat_poultry_egg_inspect
SET company_standard = 'Armour-Eckrich Meats'
WHERE company LIKE 'Armour%';

-- Repare Zip codes with concatination:

-- Make a backup:
ALTER TABLE meat_poultry_egg_inspect
ADD COLUMN zip_copy VARCHAR(5);

UPDATE meat_poultry_egg_inspect
SET zip_copy = zip;

SELECT st, zip
FROM meat_poultry_egg_inspect
WHERE st IN('CT','MA','ME','NH','NJ','RI','VT');

-- Update zips for 'PR', 'VI'

UPDATE meat_poultry_egg_inspect
SET zip = '00' || zip
WHERE st IN('PR','VI') AND length(zip) = 3;

-- Update more Zips
UPDATE meat_poultry_egg_inspect
SET zip = '0' || zip
WHERE st IN('CT','MA','ME','NH','NJ','RI','VT') AND length(zip) = 4;

SELECT length(zip),
       count(*) AS length_count
FROM meat_poultry_egg_inspect
GROUP BY length(zip)
ORDER BY length(zip) ASC;

