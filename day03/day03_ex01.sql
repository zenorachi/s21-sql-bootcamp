SELECT m.id AS menu_id
FROM menu m
WHERE m.id NOT IN (
    SELECT po.menu_id
    FROM person_order po
)
ORDER BY menu_id;