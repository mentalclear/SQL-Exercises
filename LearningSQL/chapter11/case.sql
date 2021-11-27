SELECT first_name, last_name,
    CASE 
        WHEN active = 1 THEN 'ACTIVE'
        ELSE 'INACTIVE'
    END activity_type
FROM customer;