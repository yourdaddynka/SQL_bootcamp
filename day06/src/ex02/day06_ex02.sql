SELECT person.name, menu.pizza_name, menu.price, menu.price * (1-0.01 * person_discounts.discount) AS discount_price, pizzeria.name FROM person_order
JOIN person ON person.id = person_order.person_id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
JOIN person_discounts ON person_discounts.person_id = person_order.person_id AND pizzeria.id = person_discounts.pizzeria_id
ORDER BY person.name, menu.pizza_name;