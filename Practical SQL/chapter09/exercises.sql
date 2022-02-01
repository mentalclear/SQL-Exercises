--Exercise 9-1
ALTER TABLE meat_poultry_egg_inspect 
ADD COLUMN meat_processing BOOLEAN, 
ADD COLUMN poultry_processing BOOLEAN;


--Exercise 9-2
UPDATE meat_poultry_egg_inspect
SET meat_processing = TRUE
WHERE activities LIKE '%Meat Processing%';

UPDATE meat_poultry_egg_inspect
SET poultry_processing = TRUE
WHERE activities LIKE '%Poultry Processing%';

--Exercise 9-3
SELECT count(company) AS "Q-ty", meat_processing 
FROM meat_poultry_egg_inspect
WHERE meat_processing = TRUE
GROUP BY meat_processing;

SELECT count(company) AS "Q-ty", poultry_processing 
FROM meat_poultry_egg_inspect
WHERE poultry_processing = TRUE
GROUP BY poultry_processing;

SELECT count(company) AS "Q-ty", meat_processing, poultry_processing 
FROM meat_poultry_egg_inspect
WHERE meat_processing = TRUE AND poultry_processing = TRUE
GROUP BY meat_processing, poultry_processing;

-- Suggested solutions:
SELECT count(meat_processing), count(poultry_processing)
FROM meat_poultry_egg_inspect;

SELECT count(*)
FROM meat_poultry_egg_inspect
WHERE meat_processing = TRUE AND
      poultry_processing = TRUE;


SELECT * FROM meat_poultry_egg_inspect;

SELECT activities, meat_processing, poultry_processing FROM meat_poultry_egg_inspect
OR poultry_processing = TRUE;
