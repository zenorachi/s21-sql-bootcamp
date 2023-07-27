SELECT order_date,
       CONCAT(
           name,
           ' (age:',
           CAST(age AS varchar),
           ')'
           ) AS person_information
FROM person_order
NATURAL JOIN person
ORDER BY order_date, person_information;