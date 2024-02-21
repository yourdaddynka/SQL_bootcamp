SELECT DISTINCT order_date AS missing_date FROM person_order
LEFT JOIN (SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2 ) AS pv ON person_order.order_date = pv.visit_date
WHERE pv.visit_date IS NULL AND order_date between '2022-01-01' and '2022-01-10' 
ORDER BY order_date;