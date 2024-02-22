EXPLAIN ANALYZE SELECT m.pizza_name AS pizza_name, max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;

SET ENABLE_SEQSCAN TO OFF;
CREATE INDEX IF NOT EXISTS idx_1 ON pizzeria (rating);
-- SELECT * FROM pg_indexes WHERE indexname = 'idx_1';

EXPLAIN ANALYZE SELECT m.pizza_name AS pizza_name, max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;

-- до создания частично уникального индекса:

-- Sort  (cost=134.34..136.21 rows=750 width=96) (actual time=0.155..0.157 rows=18 loops=1)
--   Sort Key: m.pizza_name, (max(pz.rating) OVER (?))
--   Sort Method: quicksort  Memory: 26kB
--   ->  WindowAgg  (cost=83.52..98.52 rows=750 width=96) (actual time=0.079..0.090 rows=18 loops=1)
--         ->  Sort  (cost=83.52..85.40 rows=750 width=64) (actual time=0.067..0.069 rows=18 loops=1)
--               Sort Key: pz.rating
--               Sort Method: quicksort  Memory: 26kB
--               ->  Hash Join  (cost=28.23..47.70 rows=750 width=64) (actual time=0.041..0.047 rows=18 loops=1)
--                     Hash Cond: (m.pizzeria_id = pz.id)
--                     ->  Seq Scan on menu m  (cost=0.00..17.50 rows=750 width=40) (actual time=0.007..0.008 rows=18 loops=1)
--                     ->  Hash  (cost=18.10..18.10 rows=810 width=40) (actual time=0.024..0.024 rows=6 loops=1)
--                           Buckets: 1024  Batches: 1  Memory Usage: 9kB
--                           ->  Seq Scan on pizzeria pz  (cost=0.00..18.10 rows=810 width=40) (actual time=0.010..0.011 rows=6 loops=1)
-- Planning Time: 0.427 ms
-- Execution Time: 0.225 ms

-- после:

-- Sort  (cost=10000000148.04..10000000149.91 rows=750 width=96) (actual time=0.079..0.081 rows=18 loops=1)
--   Sort Key: m.pizza_name, (max(pz.rating) OVER (?))
--   Sort Method: quicksort  Memory: 26kB
--   ->  WindowAgg  (cost=10000000000.13..10000000112.22 rows=750 width=96) (actual time=0.037..0.060 rows=18 loops=1)
--         ->  Nested Loop  (cost=10000000000.13..10000000099.10 rows=750 width=64) (actual time=0.027..0.044 rows=18 loops=1)
--               Join Filter: (m.pizzeria_id = pz.id)
--               Rows Removed by Join Filter: 90
--               ->  Index Scan using idx_1 on pizzeria pz  (cost=0.13..12.22 rows=6 width=40) (actual time=0.012..0.014 rows=6 loops=1)
--               ->  Materialize  (cost=10000000000.00..10000000021.25 rows=750 width=40) (actual time=0.001..0.003 rows=18 loops=6)
--                     ->  Seq Scan on menu m  (cost=10000000000.00..10000000017.50 rows=750 width=40) (actual time=0.004..0.006 rows=18 loops=1)
-- Planning Time: 0.157 ms
-- Execution Time: 0.133 ms

-- Time : 0.255 против 0.133