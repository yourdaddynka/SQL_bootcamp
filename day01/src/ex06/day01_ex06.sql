
SELECT DISTINCT person_order.order_date AS action_date,person.name AS person_name FROM person
JOIN person_order on person_order.person_id = person.id
ORDER BY action_date, person_name DESC;
