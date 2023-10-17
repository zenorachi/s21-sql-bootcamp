WITH visits AS (SELECT pz.name,
                       COUNT(pizzeria_id),
                       'visit' AS action_type
                FROM person_visits pv
                JOIN pizzeria pz ON pv.pizzeria_id = pz.id
                GROUP BY pz.name, pizzeria_id
                ORDER BY count DESC
                LIMIT 3),
     ordres AS (SELECT pz.name,
                       COUNT(pz.name),
                       'order' AS action_type
                FROM person_order po
                JOIN menu m ON po.menu_id = m.id
                JOIN pizzeria pz ON m.pizzeria_id = pz.id
                GROUP BY pz.name
                ORDER BY count DESC
                LIMIT 3)
SELECT *
FROM visits
UNION ALL
SELECT *
FROM ordres
ORDER BY action_type ASC, count DESC;