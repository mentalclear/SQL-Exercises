CREATE TABLE animals(
    animal_id SERIAL PRIMARY KEY,
    animal_name VARCHAR(25),
    aquire_date DATE
);

CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    animal_id INTEGER REFERENCES animals (animal_id),
    quantity INTEGER
);



INSERT INTO "animals" (animal_name, aquire_date)
VALUES 
    ('Spotted turtle', '01-12-2020'),
    ('Little brown skink', '08-13-2015'),
    ('Queen snake', '04-24-2011');

INSERT INTO "species" (animal_id, quantity)
VALUES 
    (1, 8),
    (2, 3),
    (3, 4);

SELECT a.animal_name "Animal Name", a.aquire_date "Date added", s.quantity "Q-ty, pc(s)"
FROM animals a
INNER JOIN species s
ON a.animal_id = s.animal_id
WHERE s.quantity > 3
ORDER BY 1 DESC;
