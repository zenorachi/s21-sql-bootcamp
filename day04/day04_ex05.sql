-- CREATE VIEW "v_price_with_discount" --
CREATE VIEW v_price_with_discount AS
SELECT p.name, m.pizza_name, m.price, ROUND(m.price * 0.9)::INTEGER AS discount_price
FROM person p
    JOIN person_order po ON p.id = po.person_id
    JOIN menu m ON po.menu_id = m.id
ORDER BY p.name, m.pizza_name;

-- CHECK --
SELECT *
FROM v_price_with_discount;