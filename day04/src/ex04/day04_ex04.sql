CREATE VIEW v_symmetric_union AS
SELECT person_visits.person_id FROM person_visits 
WHERE person_visits.visit_date = '2022-01-02' AND person_visits.person_id NOT IN
(SELECT person_visits.person_id FROM person_visits WHERE person_visits.visit_date = '2022-01-06')
OR
(person_visits.visit_date = '2022-01-06' AND person_visits.person_id NOT IN
(SELECT person_visits.person_id FROM person_visits WHERE person_visits.visit_date = '2022-01-02'))
ORDER BY person_id;
SELECT * FROM v_symmetric_union;
-- выбираем всех посетителей, которые были 2022-01-02, но не были 2022-01-06
-- Потом всех посетителей, которые были 2022-01-06, но которые не 2022-01-02
-- объединяем 