-- 1
begin  isolation level read committed;
-- 2
begin  isolation level read committed;
-- 1
SELECT * FROM pizzeria WHERE NAME = 'Pizza Hut';
-- 2
UPDATE pizzeria SET rating = 3.6 WHERE NAME = 'Pizza Hut';
COMMIT;
-- 1
SELECT * FROM pizzeria WHERE NAME = 'Pizza Hut';
COMMIT;
SELECT * FROM pizzeria WHERE NAME = 'Pizza Hut';
-- 2
SELECT * FROM pizzeria WHERE NAME = 'Pizza Hut';