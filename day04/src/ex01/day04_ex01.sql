  SELECT name FROM v_persons_female
  union all
  SELECT name FROM v_persons_male
  order by name;