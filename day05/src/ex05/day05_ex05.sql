SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE SELECT person_id, menu_id FROM person_order WHERE person_order.order_date = '2022-01-01'; 

CREATE UNIQUE INDEX idx_person_order_order_date ON person_order (person_id,menu_id)

WHERE person_order.order_date = '2022-01-01';
-- SELECT * FROM pg_indexes WHERE indexname = 'idx_person_order_order_date';

EXPLAIN ANALYZE SELECT person_id, menu_id FROM person_order WHERE person_order.order_date = '2022-01-01'; 

-- до создания частично уникального индекса:
-- Seq Scan on person_order  (cost=10000000000.00..10000000028.12 rows=7 width=16) (actual time=0.017..0.019 rows=5 loops=1)
--   Filter: (order_date = '2022-01-01'::date)
--   Rows Removed by Filter: 15
-- Planning Time: 0.339 ms
-- Execution Time: 0.060 ms
-- после:
-- Index Only Scan using idx_person_order_order_date on person_order  (cost=0.13..8.15 rows=1 width=16) (actual time=0.024..0.026 rows=5 loops=1)
--   Heap Fetches: 5
-- Planning Time: 0.294 ms
-- Execution Time: 0.040 ms

-- rows (person_id): 7 против 1
-- Time : 0.060 против 0.040