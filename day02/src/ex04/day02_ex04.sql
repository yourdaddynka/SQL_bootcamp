WITH pizza_name AS(SELECT pizza_name from menu )
SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name,menu.price AS price  FROM menu
JOIN pizzeria ON menu.pizzeria_id =pizzeria.id
WHERE menu.pizza_name IN (SELECT pizza_name FROM menu WHERE pizza_name ='mushroom pizza' OR pizza_name ='pepperoni pizza' )
ORDER BY menu.pizza_name, pizzeria.name;
