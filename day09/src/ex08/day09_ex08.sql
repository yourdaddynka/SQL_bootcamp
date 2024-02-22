CREATE FUNCTION fnc_fibonacci(IN pstop integer default 10)
RETURNS TABLE(fibonacci_number INTEGER) AS $$
  WITH RECURSIVE fibonacci_numbers(val1, val2, step) AS (
      VALUES(1, 1, 1)
        UNION ALL
      SELECT val2, val1 + val2, step + 1 FROM fibonacci_numbers
      WHERE val2 < pstop
  )
  SELECT val1 AS fibonacci_number FROM fibonacci_numbers;
$$ LANGUAGE SQL;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();