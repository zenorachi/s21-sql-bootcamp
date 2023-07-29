-- INSERT --
INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES ((SELECT MAX(pv.id) + 1 FROM person_order pv),
        (SELECT p.id FROM person p
                     WHERE p.name = 'Denis'),
        (SELECT m.id FROM menu m
                      WHERE m.pizza_name = 'sicilian pizza'),
        '2022-02-24'),
       ((SELECT MAX(pv.id) + 2 FROM person_order pv),
        (SELECT p.id FROM person p
                     WHERE p.name = 'Irina'),
        (SELECT m.id FROM menu m
                      WHERE m.pizza_name = 'sicilian pizza'),
        '2022-02-24');

-- CHECK --
SELECT po.*, p.name AS person_name, m.pizza_name
FROM person_order po
    JOIN person p on p.id = po.person_id
    JOIN menu m on po.menu_id = m.id
WHERE po.order_date = '2022-02-24';

-- DELETE --
DELETE FROM person_order po
WHERE po.order_date = '2022-02-24'