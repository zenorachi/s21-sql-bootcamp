SELECT pizzeria_name
FROM (
    SELECT pz.name AS pizzeria_name,
           SUM(CASE WHEN p.gender = 'male' THEN 1 ELSE 0 END) AS male_visits,
           SUM(CASE WHEN p.gender = 'female' THEN 1 ELSE 0 END) AS female_visits
    FROM pizzeria pz
        JOIN person_visits pv on pz.id = pv.pizzeria_id
        JOIN person p on pv.person_id = p.id
    GROUP BY pizzeria_name
) AS visit_count
WHERE male_visits > female_visits OR female_visits > male_visits
ORDER BY pizzeria_name;