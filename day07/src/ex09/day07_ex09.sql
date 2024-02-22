WITH help_table AS (
SELECT person.address,
CAST((max(person.age::numeric) - (min(person.age::numeric)/max(person.age::numeric))) AS decimal(10,2) ) AS formula,
CAST(avg(person.age) as decimal(10,2)) AS average
FROM person
GROUP BY person.address
),
comparison_data AS (
SELECT address,formula,average,
CASE
WHEN formula > average THEN 'true' ELSE 'false'
END AS comparison
FROM help_table
)
SELECT DISTINCT address, formula, average, comparison FROM comparison_data
ORDER BY address;
