SELECT DISTINCT person.name FROM person
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
WHERE person.gender = 'female' AND menu.pizza_name = 'pepperoni pizza' AND EXISTS
(SELECT 1 FROM person_order
JOIN menu ON menu.id = person_order.menu_id
WHERE person_order.person_id = person.id AND menu.pizza_name = 'cheese pizza' )
ORDER BY person.name;
