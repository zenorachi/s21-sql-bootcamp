SELECT
    p.name,
    COUNT(*) AS count_of_visits
FROM person_visits pv
JOIN person p ON pv.person_id = p.id
GROUP BY pv.person_id, p.name
ORDER BY count_of_visits DESC, p.name ASC
LIMIT 4;