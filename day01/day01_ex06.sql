SELECT order_date AS action_date, name AS person_name
FROM person_order
JOIN person p ON p.id = person_order.person_id
INTERSECT
SELECT visit_date AS action_date, name AS person_name
FROM person_visits
JOIN person p on person_visits.person_id = p.id
ORDER BY action_date, person_name DESC;