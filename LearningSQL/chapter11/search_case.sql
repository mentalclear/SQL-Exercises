SELECT c.first_name, c.last_name,
    CASE 
        WHEN active = 0 THEN 0
        ELSE 
            (SELECT count(*) FROM rental r
            WHERE r.customer_id = c.customer_id)
        END num_rentals
FROM customer c;