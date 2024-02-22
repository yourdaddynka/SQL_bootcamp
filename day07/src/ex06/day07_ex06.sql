with help_table AS
(SELECT pizzeria.name ,
count(menu.pizzeria_id) AS count_of_orders,
CAST(avg(menu.price) as decimal(10,2)) AS average_price,
max(menu.price) AS max_price,
min(menu.price) AS min_price 
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name)
SELECT help_table.name,count_of_orders,average_price,max_price,min_price FROM help_table
order by help_table.name;