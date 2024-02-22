with help_table AS 
(SELECT person.address, pizzeria.name,count(pizzeria.name) AS count_of_orders FROM person_order
join person ON person.id = person_order.person_id
join menu ON menu.id = person_order.menu_id
join pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY pizzeria.name, person.address
) 
SELECT help_table.address,help_table.name,help_table.count_of_orders FROM help_table
ORDER BY address,name;