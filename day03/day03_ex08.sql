-- INSERT --
INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES ((SELECT MAX(id) + 1 FROM menu),
        (SELECT id FROM pizzeria
                   WHERE name = 'Dominos'),
        'sicilian pizza',
        900);

-- CHECK --
SELECT menu.*, pz.name AS pizzeria_name
FROM menu
    JOIN pizzeria pz on menu.pizzeria_id = pz.id
WHERE menu.pizza_name = 'sicilian pizza';

-- DELETE --
DELETE FROM menu
WHERE pizza_name = 'sicilian pizza';