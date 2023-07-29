WITH visit_by_males AS
    (SELECT pz.name AS pizzeria_name
     FROM pizzeria pz
        JOIN person_visits pv on pz.id = pv.pizzeria_id
        JOIN person p on pv.person_id = p.id
                             AND p.gender = 'male'),
    visit_by_females AS
    (SELECT pz.name AS pizzeria_name
     FROM pizzeria pz
        JOIN person_visits pv on pz.id = pv.pizzeria_id
        JOIN person p on pv.person_id = p.id
                             AND p.gender = 'female')
(SELECT pizzeria_name
FROM visit_by_males EXCEPT ALL (
        SELECT *
        FROM visit_by_females
    )
)
UNION ALL
(SELECT pizzeria_name
FROM visit_by_females EXCEPT ALL (
        SELECT *
        FROM visit_by_males
    )
)
ORDER BY pizzeria_name;