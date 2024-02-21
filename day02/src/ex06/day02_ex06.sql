SELECT menu.pizza_name AS pizza_name,pizzeria.name AS pizzeria_name FROM person
JOIN person_order on person_order.person_id =person.id AND person_order.person_id in (SELECT id FROM person where name = 'Anna' or name = 'Denis')
join menu on menu.id = person_order.menu_id
join pizzeria on pizzeria.id = menu.pizzeria_id
ORDER BY pizza_name,pizzeria_name;