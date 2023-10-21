SELECT
    p.address,
    pz.name,
    COUNT(pz.name) AS count_of_orders
FROM person p
JOIN person_order po ON po.person_id = p.id
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz on m.pizzeria_id = pz.id
GROUP BY p.address, pz.name
ORDER BY p.address, pz.name;