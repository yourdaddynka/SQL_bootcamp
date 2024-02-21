insert into person_order (id, person_id, menu_id, order_date) 
SELECT (SELECT max(id) FROM person_order)+gen,
id,
(SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
'2022-02-25'
FROM person JOIN generate_series(1, (SELECT COUNT(*) FROM person)) AS gen ON gen = person.id;
