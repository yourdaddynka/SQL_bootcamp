    WITH posetil AS
    (SELECT pizzeria.name AS pizzeria_name ,person_visits.person_id, person_visits.visit_date FROM person_visits
    JOIN person ON person.id = person_visits.person_id
    JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    WHERE person.name = 'Andrey'),
    zakazal AS(SELECT pizzeria.name AS pizzeria_name, person_order.person_id, person_order.order_date FROM person_order
    JOIN person ON person.id = person_order.person_id
    JOIN menu ON menu.id = person_order.menu_id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    WHERE person.name = 'Andrey')

    SELECT posetil.pizzeria_name FROM posetil
    LEFT JOIN zakazal ON posetil.pizzeria_name = zakazal.pizzeria_name 
    WHERE zakazal.pizzeria_name IS NULL;
