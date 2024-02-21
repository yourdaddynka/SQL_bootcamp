WITH visits_total AS 
(SELECT person_id, pizzeria.name AS pizzeria_name,person.gender FROM person_visits
JOIN person ON person.id = person_visits.person_id
JOIN pizzeria ON pizzeria.id =person_visits.pizzeria_id),

males AS (SELECT pizzeria_name, COUNT(visits_total.gender) AS num FROM visits_total WHERE gender = 'male'
GROUP by pizzeria_name),

females AS (SELECT pizzeria_name, COUNT(visits_total.gender) AS num FROM visits_total WHERE gender = 'female'
GROUP by pizzeria_name)

SELECT females.pizzeria_name FROM females
JOIN males ON females.pizzeria_name = males.pizzeria_name
WHERE males.num <> females.num
ORDER BY pizzeria_name;
