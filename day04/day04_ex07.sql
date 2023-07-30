-- INSERT --
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id) FROM person_visits) + 1,
        (SELECT p.id FROM person p
                   WHERE p.name = 'Dmitriy'),
        (SELECT m.pizzeria_id FROM menu m
                            JOIN pizzeria pz ON m.pizzeria_id = pz.id AND pz.name != 'Papa Johns'
                    WHERE price < 800
                    LIMIT 1),
        ('2022-01-08')
);

-- REFRESH --
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;