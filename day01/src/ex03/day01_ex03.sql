SELECT order_date AS action_date,person_id AS person_id FROM person_order
WHERE (order_date, person_id) IN (SELECT visit_date AS action_date,person_id AS person_id FROM person_visits)
UNION
SELECT visit_date AS action_date,person_id AS person_id FROM person_visits
WHERE (visit_date, person_id) IN (SELECT order_date AS action_date,person_id AS person_id FROM person_order)
ORDER BY action_date,person_id DESC;
