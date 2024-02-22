WITH vis AS (
SELECT pizzeria.name, count(pizzeria_id), 'visit' AS action_type FROM person_visits
join pizzeria ON pizzeria.id = person_visits.pizzeria_id
GROUP BY  pizzeria.name
order by action_type,count(pizzeria_id) DESC LIMIT 3),
ord AS (
SELECT pizzeria.name, count(pizzeria_id) , 'order' AS action_type FROM person_order
join menu ON menu.id = person_order.menu_id
join pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY  pizzeria.name
order by action_type,count(pizzeria_id) DESC LIMIT 3)
SELECT * FROM vis
UNION ALL 
SELECT * FROM ord
ORDER BY action_type,count DESC;