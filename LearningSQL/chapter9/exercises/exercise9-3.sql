SELECT actr.actor_id, grps.level
FROM
(
    SELECT actor_id, count(*) num_roles
    FROM film_actor
    GROUP BY actor_id
) actr
INNER JOIN
(
    SELECT 'Hollywood Star' level, 30 min_roles, 99999 max_roles
    UNION ALL
    SELECT 'Prolific Actor' level, 20 min_roles, 29 max_roles
    UNION ALL
    SELECT 'Newcomer' level, 1 min_roles, 19 max_roles
) grps
ON actr.num_roles BETWEEN grps.min_roles AND grps.max_roles;