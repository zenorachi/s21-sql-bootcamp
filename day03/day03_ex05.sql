SELECT pz.name AS pizzeria_name
FROM person_visits pv
    JOIN person p ON pv.person_id = p.id AND p.name = 'Andrey'
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
WHERE NOT EXISTS (
    SELECT
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    WHERE po.person_id = p.id
      AND m.pizzeria_id = pz.id
)
ORDER BY pizzeria_name;