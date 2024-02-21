
WITH data AS (SELECT dayhelp::date AS missing_date FROM generate_series(timestamp '2022-01-01','2022-01-10','1 day' ) AS dayhelp ),
pv_help AS (SELECT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2 )
SELECT data.missing_date FROM data
LEFT JOIN pv_help ON data.missing_date = pv_help.visit_date
WHERE pv_help.visit_date IS NULL
ORDER BY data;
