SELECT menu.pizza_name, menu.price , pizzeria.name AS pizzeria_name ,person_visits.visit_date FROM menu
JOIN pizzeria on pizzeria.id = menu.pizzeria_id AND menu.price between 800 AND 1000
JOIN person_visits on pizzeria.id = person_visits.pizzeria_id 
JOIN person on person.id = person_visits.person_id AND person.name = 'Kate'
ORDER BY pizza_name,price,pizzeria_name;