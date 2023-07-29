-- UPDATE --
UPDATE menu
SET price = price * 0.9
WHERE pizza_name = 'greek pizza';

-- CHECK --
SELECT pizza_name, price
FROM menu
WHERE pizza_name = 'greek pizza';