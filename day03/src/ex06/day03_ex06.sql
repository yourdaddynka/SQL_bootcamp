WITH pizzeria1 AS 
(SELECT DISTINCT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name_1, menu.price, pizzeria.id FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
),
pizzeria2 AS (SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name_2, menu.price, pizzeria.id FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
)
SELECT DISTINCT pizzeria1.pizza_name, pizzeria1.pizzeria_name_1, pizzeria2.pizzeria_name_2, pizzeria1.price FROM pizzeria1 
JOIN pizzeria2 ON pizzeria1.pizza_name = pizzeria2.pizza_name AND pizzeria1.price = pizzeria2.price
WHERE pizzeria1.id < pizzeria2.id
ORDER BY 1;
