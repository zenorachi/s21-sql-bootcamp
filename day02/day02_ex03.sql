WITH day_gen AS (
    SELECT missing_date::date
        FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS missing_date
)
SELECT missing_date
FROM day_gen
LEFT JOIN (
    SELECT visit_date
    FROM person_visits AS pv
    WHERE pv.person_id = 1 OR pv.person_id = 2
) AS tmp ON day_gen.missing_date = tmp.visit_date
WHERE tmp.visit_date IS NULL
ORDER BY missing_date;