-- CREATE INDEX --
CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name);

-- CHECK --
SET enable_seqscan = OFF;

EXPLAIN ANALYSE
SELECT pizzeria_id, pizza_name
FROM menu
WHERE pizza_name = 'sausage pizza';