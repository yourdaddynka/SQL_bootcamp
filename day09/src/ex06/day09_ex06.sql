CREATE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson varchar DEFAULT 'Dmitriy', IN pprice numeric DEFAULT 500, IN pdate date DEFAULT '2022-01-08')
RETURNS TABLE (pizza_name varchar) AS $$
BEGIN
	RETURN QUERY SELECT pizzeria.name
    FROM person_visits
    JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person ON person.id = person_visits.person_id
    WHERE person.name = pperson AND menu.price < pprice AND person_visits.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;


select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
