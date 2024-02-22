-- 1
BEGIN ISOLATION LEVEL READ COMMITTED;
-- 2
BEGIN ISOLATION LEVEL READ COMMITTED;
-- 1
SELECT SUM(rating) FROM pizzeria;
-- 2
UPDATE pizzeria SET rating = 1 WHERE NAME = 'Pizza Hut';
COMMIT;
-- 1
SELECT SUM(rating) FROM pizzeria;

COMMIT;
SELECT SUM(rating) FROM pizzeria;

-- 2
SELECT SUM(rating) FROM pizzeria;
