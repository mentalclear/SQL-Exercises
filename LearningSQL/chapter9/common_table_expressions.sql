/*
    This one doesn't work in PostgreSQL
*/
WITH actors_s AS
(SELECT actor_id, first_name, last_name
 FROM actor
 WHERE last_name LIKE 'S%'
),
actors_s_pg AS
  (SELECT s.actor_id, s.first_name, s.last_name,
     f.film_id, f.title
   FROM actors_s s
     INNER JOIN film_actor fa
     ON s.actor_id = fa.actor_id
     INNER JOIN film f
     ON f.film_id = fa.film_id
   WHERE f.rating = 'PG'
  ),
  actors_s_pg_revenue AS
  (SELECT spg.first_name, spg.last_name, p.amount
   FROM actors_s_pg spg
     INNER JOIN inventory i
     ON i.film_id = spg.film_id
     INNER JOIN rental r
     ON i.inventory_id = r.inventory_id
     INNER JOIN payment p
     ON r.rental_id = p.rental_id
  ) -- end of With clause
 SELECT spg_rev.first_name, spg_rev.last_name,
   sum(spg_rev.amount) tot_revenue
 FROM actors_s_pg_revenue spg_rev
 GROUP BY spg_rev.first_name, spg_rev.last_name
 ORDER BY 3 desc;