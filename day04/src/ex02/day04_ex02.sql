CREATE VIEW v_generated_dates AS
select generated_date::date from generate_series('2022-01-01', '2022-01-31', interval '1 day') as generated_date
ORDER BY generated_date;
