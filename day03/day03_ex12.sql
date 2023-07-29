-- INSERT --
INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT ((SELECT MAX(id) FROM person_order) + i),
      (i),
       (SELECT id FROM menu
                  WHERE pizza_name = 'greek pizza'),
       ('2022-02-25')
FROM generate_series((SELECT MIN(id) FROM person), (SELECT MAX(id) FROM person)) AS t(i);

-- CHECK --
SELECT *
FROM person_order
JOIN menu m on m.id = person_order.menu_id
WHERE m.pizza_name = 'greek pizza';

-- DELETE --
DELETE FROM person_order po
WHERE po.menu_id IN (SELECT m.id FROM menu m WHERE m.pizza_name = 'greek pizza')