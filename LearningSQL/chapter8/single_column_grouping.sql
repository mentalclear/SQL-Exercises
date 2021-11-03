/*
If you want to find the number of films associated with each actor, for example, 
you need only group on the film_actor.actor_id column
*/
SELECT actor_id, count(*)
FROM film_actor
GROUP BY actor_id;