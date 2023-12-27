-- Session 1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session 2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session 1
SELECT * from pizzeria WHERE name = 'Pizza Hut';

-- Session 2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut'; 
COMMIT;

-- Session 1
SELECT * from pizzeria WHERE name = 'Pizza Hut';
COMMIT;

-- Session 1
SELECT * from pizzeria WHERE name = 'Pizza Hut';

-- Session 2
SELECT * from pizzeria WHERE name = 'Pizza Hut';