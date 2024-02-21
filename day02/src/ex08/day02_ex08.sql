SELECT DISTINCT person.name FROM person
JOIN person_visits ON person_visits.person_id = person.id
JOIN person_order ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
WHERE (menu.pizza_name = 'pepperoni pizza' OR menu.pizza_name = 'mushroom pizza') AND person.gender ='male' AND (person.address = 'Moscow' OR person.address = 'Samara')
ORDER BY person.name DESC;