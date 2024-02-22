-- 1
begin transaction isolation level repeatable read;
-- 2
begin transaction isolation level repeatable read;
-- 1
SELECT SUM(rating) FROM pizzeria;
-- 2
UPDATE pizzeria SET rating = 5 WHERE NAME = 'Pizza Hut';
COMMIT;
-- 1
SELECT SUM(rating) FROM pizzeria;
COMMIT;
SELECT SUM(rating) FROM pizzeria;

-- 2
SELECT SUM(rating) FROM pizzeria;
