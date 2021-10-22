SELECT cb.starttime as start, cf.name
	FROM cd.bookings cb
	JOIN cd.facilities cf ON
	cb.facid = cf.facid
	WHERE cf.name in ('Tennis Court 2', 'Tennis Court 1')
	AND cb.starttime >= '2012-09-21' and cb.starttime < '2012-09-22'
	ORDER BY cb.starttime;