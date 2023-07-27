SELECT person.name AS person_name, pizza_name, pizzeria.name AS pizzeria_name
FROM person
JOIN person_order po ON person.id = po.person_id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria ON pizzeria.id = m.pizzeria_id
ORDER BY person_name, pizza_name, pizzeria_name;