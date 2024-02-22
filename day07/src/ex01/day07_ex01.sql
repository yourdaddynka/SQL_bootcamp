SELECT person.name, COUNT(person_visits.id) AS count_of_visits FROM person_visits
JOIN person ON person.id = person_visits.person_id
GROUP BY person_id,person.name
ORDER BY  count_of_visits DESC, person.name, 1 limit 4;