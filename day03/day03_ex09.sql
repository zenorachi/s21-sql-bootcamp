-- INSERT --
INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(pv.id) + 1 FROM person_visits pv),
        (SELECT p.id FROM person p
                     WHERE p.name = 'Denis'),
        (SELECT pz.id FROM pizzeria pz
                      WHERE pz.name = 'Dominos'),
        '2022-02-24'),
       ((SELECT MAX(pv.id) + 2 FROM person_visits pv),
        (SELECT p.id FROM person p
                     WHERE p.name = 'Irina'),
        (SELECT pz.id FROM pizzeria pz
                      WHERE pz.name = 'Dominos'),
        '2022-02-24');

-- CHECK --
SELECT pv.*, p.name AS person_name
FROM person_visits pv
    JOIN person p on p.id = pv.person_id
WHERE pv.visit_date = '2022-02-24';

-- DELETE --
DELETE FROM person_visits pv
WHERE pv.visit_date = '2022-02-24'