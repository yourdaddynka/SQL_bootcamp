CREATE VIEW v_price_with_discount AS
WITH discount_price AS(SELECT menu.id, CAST(ROUND(price * 0.9) AS INTEGER)  AS price_sale  FROM menu)
SELECT person.name, pizza_name, price, discount_price.price_sale  AS discount_price FROM menu
JOIN person_order ON menu.id = person_order.menu_id
JOIN person ON person_order.person_id = person.id
JOIN discount_price ON discount_price.id = menu.id
ORDER BY person.name,pizza_name;
-- SELECT * FROM v_price_with_discount