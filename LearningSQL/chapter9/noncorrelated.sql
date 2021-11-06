SELECT city_id, city
FROM city
WHERE country_id <> 
(   
    SELECT country_id 
    FROM country 
    WHERE country = 'India'
);

-- Erroneous
SELECT city_id, city
FROM city
WHERE country_id <> 
(   
    SELECT country_id 
    FROM country 
    WHERE country <> 'India'
);

