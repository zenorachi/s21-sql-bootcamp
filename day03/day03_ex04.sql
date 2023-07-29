SELECT pizzeria_name
FROM (
    SELECT pz.name AS pizzeria_name,
           SUM(CASE WHEN p.gender = 'male' THEN 1 ELSE 0 END) AS male_order,
           SUM(CASE WHEN p.gender = 'female' THEN 1 ELSE 0 END) AS female_order
    FROM pizzeria pz
        JOIN menu m on pz.id = m.pizzeria_id
        JOIN person_order po ON m.id = po.menu_id
        JOIN person p ON po.person_id = p.id
    GROUP BY pz.name
     ) AS order_count
WHERE male_order > 0 AND female_order = 0
    OR female_order > 0 AND male_order = 0
ORDER BY pizzeria_name;

-- THE SAME STATEMENT USING `UNION`,  `EXCEPT` --

WITH male_order AS (
    SELECT pz.name AS pizzeria_name
    FROM pizzeria pz
        JOIN menu m on pz.id = m.pizzeria_id
        JOIN person_order po ON m.id = po.menu_id
        JOIN person p ON po.person_id = p.id
                             AND p.gender = 'male'
    ), female_order AS (
    SELECT pz.name AS pizzeria_name
    FROM pizzeria pz
        JOIN menu m on pz.id = m.pizzeria_id
        JOIN person_order po ON m.id = po.menu_id
        JOIN person p ON po.person_id = p.id
                             AND p.gender = 'female'
    )
(
SELECT pizzeria_name
FROM male_order EXCEPT (
        SELECT * FROM female_order
    )
)
UNION
(
SELECT pizzeria_name
FROM female_order EXCEPT ALL (
        SELECT * FROM male_order
    )
)
ORDER BY pizzeria_name;