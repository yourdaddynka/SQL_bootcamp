SELECT pers_ord.order_date, (SELECT CONCAT(pers.name,' (','age:',age,')')) AS person_information 
FROM (person_order AS pers_ord(primary_id, id, menu_id, order_date) NATURAL JOIN person AS pers)
ORDER BY order_date,person_information;
