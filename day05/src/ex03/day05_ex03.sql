CREATE INDEX idx_person_order_multi ON person_order (person_id, menu_id, order_date);
-- SELECT * FROM pg_indexes WHERE indexname = 'idx_person_order_multi';
SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE SELECT person_id, menu_id,order_date FROM person_order WHERE person_id = 8 AND menu_id = 19;


-- Index Only Scan using idx_person_order_multi on person_order  (cost=0.14..8.16 rows=1 width=20) (actual time=0.015..0.016 rows=0 loops=1)
--   Index Cond: ((person_id = 8) AND (menu_id = 19))
--   Heap Fetches: 0
-- Planning Time: 0.267 ms
-- Execution Time: 0.036 ms
