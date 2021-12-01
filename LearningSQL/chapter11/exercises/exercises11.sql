-- Exercise 11-1
SELECT name,
CASE 
    WHEN name IN ('English', 'Italian', 'French', 'German')
        THEN 'latin1'
    WHEN name IN ('Japanese', 'Mandarin')
        THEN 'utf8'
    ELSE 'Unknown'
END character_set
FROM language;


-- Exercise 11-2
SELECT rating, count(*) 
FROM film 
GROUP BY rating;

-- Rewritten:
SELECT 
    sum(CASE WHEN rating ='G' THEN 1 ELSE 0 END) g,
    sum(CASE WHEN rating ='PG' THEN 1 ELSE 0 END) pg,
    sum(CASE WHEN rating ='PG-13' THEN 1 ELSE 0 END) pg_13,
    sum(CASE WHEN rating ='R' THEN 1 ELSE 0 END) r,
    sum(CASE WHEN rating ='NC-17' THEN 1 ELSE 0 END) nc_17
FROM film;
