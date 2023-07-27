SELECT DISTINCT order_date AS action_date, person_id
FROM person_order
WHERE (order_date, person_id) IN (
    SELECT person_visits.visit_date, person_visits.person_id
    FROM person_visits
)
ORDER BY order_date, person_id DESC;