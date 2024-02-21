WITH visits_total AS 
(SELECT DISTINCT pizzeria.name AS pizzeria_name,person.gender FROM person_order
JOIN menu ON menu.id = person_order.menu_id
JOIN person ON person.id = person_order.person_id
JOIN pizzeria ON pizzeria.id =menu.pizzeria_id),

minus AS (SELECT pizzeria_name,COUNT(visits_total.gender) AS numb FROM visits_total
GROUP BY pizzeria_name)

SELECT pizzeria_name FROM minus
 Where numb =1;

-- gender_count = 1 означает, что в этом запросе мы выбираем только те пиццерии,
--  где количество уникальных гендеров людей, сделавших заказ, равно 1.
--   Это может означать, что либо только мужчины, либо только женщины делали заказы в каждой из пиццерий,
--    название которой возвращается в результате запроса.