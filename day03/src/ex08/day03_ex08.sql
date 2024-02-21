insert into menu (id, pizzeria_id, pizza_name, price) values ((SELECT max(id) FROM menu)+1,(SELECT id FROM pizzeria WHERE name = 'Dominos'),'sicilian pizza', 900);
