
    WITH total_count AS 
    (SELECT menu.pizzeria_id, count(*) AS count_number 
    FROM person_order 
    join menu ON person_order.menu_id = menu.id
    GROUP BY menu.pizzeria_id
    UNION ALL
    SELECT person_visits.pizzeria_id, count(*) AS count_number 
    FROM person_visits
    GROUP BY person_visits.pizzeria_id
    )
    SELECT pizzeria.name , SUM(total_count.count_number) AS total_count FROM pizzeria
    LEFT JOIN total_count ON pizzeria.id = total_count.pizzeria_id
    GROUP BY pizzeria.name
    ORDER BY   total_count DESC,pizzeria.name ;