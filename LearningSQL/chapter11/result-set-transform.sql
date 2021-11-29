-- PostgreSQL ready solution
SELECT TO_CHAR(rental_date, 'month') AS rental_month,
count(*) num_rentals
FROM rental
WHERE rental_date BETWEEN '2005-05-01' AND '2005-08-01'
GROUP BY TO_CHAR(rental_date, 'month');

-- Using CASE, actually didn't work for me
SELECT 
    SUM(CASE WHEN TO_CHAR(rental_date, 'month') = 'May' THEN 1
        ELSE 0 END) May_rentals,
    SUM(CASE WHEN TO_CHAR(rental_date, 'month') = 'june' THEN 1
        ELSE 0 END) June_rentals,
    SUM(CASE WHEN TO_CHAR(rental_date, 'month') = 'july' THEN 1
        ELSE 0 END) July_rentals
FROM rental
WHERE rental_date BETWEEN '2005-05-01' AND '2005-08-01';