-- CREATE VIEW --
CREATE VIEW v_persons_female AS
SELECT *
FROM person
WHERE gender = 'female';

CREATE VIEW v_persons_male AS
SELECT *
FROM person
WHERE gender = 'male';

-- CHECK FEMALES --
SELECT *
FROM v_persons_female;

-- CHECK MALES --
SELECT *
FROM v_persons_male;