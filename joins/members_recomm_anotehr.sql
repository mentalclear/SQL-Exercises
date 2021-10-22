-- The idea here is the table is being joined on itself. 
-- And distinct results are being ordered.

-- Selecting firstname and surname from the second table thatis being joined.
SELECT DISTINCT ref.firstname, ref.surname   
FROM cd.members cm
JOIN cd.members ref    -- same table is being joined. but with another alias.

-- This is the key here. 
-- Joinning memid from the second table and recommendedby from the first. 
ON ref.memid = cm.recommendedby 

ORDER BY surname, firstname;