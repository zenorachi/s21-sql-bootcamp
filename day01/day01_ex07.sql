SELECT order_date,
       CONCAT(
           name,
           '(age:',
           CAST(age AS varchar),
           ')'
           ) AS person_information
FROM person_order
JOIN person p ON p.id = person_order.person_id
ORDER BY order_date, person_information