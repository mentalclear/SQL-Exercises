SELECT act.actor_id, act.first_name, act.last_name
FROM actor act
WHERE act.last_name = 'WILLIAMS' OR last_name = 'DAVIS'
ORDER BY act.last_name;