WITH visit_count AS (
    SELECT person_id, COUNT(*) AS count_of_visits
    FROM person_visits
    GROUP BY person_id
    HAVING COUNT(*) > 3
)
SELECT person.name, visit_count.count_of_visits
FROM visit_count 
JOIN person ON person.id = visit_count.person_id
ORDER BY visit_count.count_of_visits DESC;