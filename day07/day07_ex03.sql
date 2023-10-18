WITH result AS ((SELECT pz.name,
                     count(pizzeria_id)
                FROM person_visits pv
                JOIN pizzeria pz ON pz.id = pv.pizzeria_id
                GROUP BY pz.name
                ORDER BY count DESC)
                UNION ALL
                (SELECT pz.name,
                        count(pz.name)
                FROM person_order po
                JOIN menu m ON po.menu_id = m.id
                JOIN pizzeria pz ON pz.id = m.pizzeria_id
                GROUP BY pz.name
                ORDER BY count DESC))

SELECT
    name,
    SUM(count) AS total_count
FROM result
GROUP BY name
ORDER BY total_count DESC, name ASC;