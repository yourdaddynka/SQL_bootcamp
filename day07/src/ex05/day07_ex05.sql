SELECT DISTINCT name from person
join person_order ON person_order.person_id = person.id
order by name