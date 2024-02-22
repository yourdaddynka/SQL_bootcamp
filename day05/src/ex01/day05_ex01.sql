SET ENABLE_SEQSCAN TO OFF;
--отключение последовательного чтени]
SELECT menu.pizza_name , pizzeria.name AS pizzeria_name FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;

CREATE INDEX idx_menu_pizzeria_id ON menu (pizzeria_id);

EXPLAIN ANALYZE SELECT menu.pizza_name , pizzeria.name AS pizzeria_name FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id;
