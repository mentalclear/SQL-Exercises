DROP TABLE meat_poultry_egg_inspect_backup;

CREATE TABLE meat_poultry_egg_inspect_backup AS
SELECT *,
       '2018-02-07'::date AS reviewed_date
FROM meat_poultry_egg_inspect;

SELECT count(reviewed_date) FROM meat_poultry_egg_inspect_backup;

ALTER TABLE meat_poultry_egg_inspect RENAME TO meat_poultry_egg_inspect_temp;
ALTER TABLE meat_poultry_egg_inspect_backup
RENAME TO meat_poultry_egg_inspect;
ALTER TABLE meat_poultry_egg_inspect_temp
RENAME TO meat_poultry_egg_inspect_backup;