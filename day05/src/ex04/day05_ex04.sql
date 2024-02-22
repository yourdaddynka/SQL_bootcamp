SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE SELECT pizzeria_id, pizza_name FROM menu;

CREATE UNIQUE INDEX idx_menu_unique ON menu USING BTREE (pizzeria_id, pizza_name);
-- SELECT * FROM pg_indexes WHERE indexname = 'idx_menu_unique';

EXPLAIN ANALYZE SELECT pizzeria_id, pizza_name FROM menu;

-- до создания уникального индекса:
-- Seq Scan on menu  (cost=10000000000.00..10000000017.50 rows=750 width=40) (actual time=0.007..0.011 rows=18 loops=1)
-- Planning Time: 0.142 ms
-- Execution Time: 0.072 ms
-- после:
-- Index Only Scan using idx_menu_unique on menu  (cost=0.14..12.41 rows=18 width=40) (actual time=0.033..0.038 rows=18 loops=1)
--   Heap Fetches: 18
-- Planning Time: 0.341 ms
-- Execution Time: 0.053 ms

-- rows : 750 против 18
-- Time : 0.072 против 0.053 