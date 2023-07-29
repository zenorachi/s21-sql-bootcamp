-- INSERT --
INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (19, 2, 'greek pizza', 800);

-- CHECK --
SELECT menu.*, pz.name AS pizzeria_name
FROM menu
    JOIN pizzeria pz on menu.pizzeria_id = pz.id
WHERE menu.id = 19;

-- DELETE --
DELETE FROM menu
WHERE id = 19