SELECT 
	firstname, surname, joindate 
FROM 
	cd.members
WHERE 
	joindate = (
	  SELECT 
	  	MAX(joindate) joindate
	  FROM 
	  	cd.members);

-- Another solution:   
select firstname, surname, joindate
	from cd.members
order by joindate desc
limit 1;       