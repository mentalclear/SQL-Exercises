select cb.starttime
	from cd.bookings cb
	inner join cd.members cm
		on cb.memid = cm.memid
	where
		cm.firstname = 'David' and cm.surname='Farrell';