COMMENT ON TABLE person_discounts
    IS 'Таблица хранит информацию о скидках для каждого клиента и соответствующей пиццерии';
COMMENT ON COLUMN person_discounts.id
    IS 'Уникальный идентификатор';
COMMENT ON COLUMN person_discounts.person_id
    IS 'Индекс клиента';
COMMENT ON COLUMN person_discounts.pizzeria_id
    IS 'Индекс пиццерии';
COMMENT ON COLUMN person_discounts.discount
    IS 'Скидка для конкретного клиента в соответствующей пиццерии';
     SELECT * FROM person_discounts
