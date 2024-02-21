insert into person_visits (id, person_id, pizzeria_id, visit_date) 
values (((SELECT max(id) FROM person_visits)+1),
(SELECT person.id FROM person WHERE name = 'Dmitriy'),
 (SELECT pizzeria.id FROM pizzeria
 JOIN menu ON menu.pizzeria_id = pizzeria.id
 WHERE menu.price < 800 AND name !='Papa Johns'
 LIMIT 1),
'2022-01-08');

-- SELECT * FROM person_visits

REFRESH MATERIALIZED VIEW  mv_dmitriy_visits_and_eats;

-- SELECT * FROM mv_dmitriy_visits_and_eats
