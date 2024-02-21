SELECT menu.pizza_name, menu.price, pizzeria.name AS pizzeria_name FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE menu.id NOT iN (SELECT menu_id FROM person_order WHERE person_order.menu_id = menu.id)
ORDER BY pizza_name,price;