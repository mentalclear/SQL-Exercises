SELECT a1.address addr1, a2.address addr2, a1.city_id
FROM address a1
INNER JOIN address a2
ON a1.city_id = a2.city_id
AND a1.address < a2.address;