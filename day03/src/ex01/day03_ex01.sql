SELECT DISTINCT menu.id AS menu_id FROM menu
WHERE id NOT iN (SELECT menu_id FROM person_order WHERE person_order.menu_id = menu.id)
ORDER BY menu_id;