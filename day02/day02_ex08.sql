SELECT p.name
FROM person p
    JOIN person_order po ON po.person_id = p.id
    JOIN menu m ON m.id = po.menu_id
                       AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
WHERE p.address IN ('Moscow', 'Samara')
  AND p.gender = 'male'
ORDER BY p.name DESC;