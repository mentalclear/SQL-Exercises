-- Create temporary table
CREATE TEMPORARY TABLE actors_j
(actor_id serial,
 first_name varchar(45),
 last_name varchar(45) 
);

-- insering the data using select as a source. 
INSERT INTO actors_j
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor.last_name LIKE 'J%';


-- Retreiving data
SELECT * FROM actors_j;