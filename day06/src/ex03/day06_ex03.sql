
CREATE unique INDEX idx_person_discounts_unique ON person_discounts(person_id,pizzeria_id);

SET ENABLE_SEQSCAN TO OFF;

EXPLAIN ANALYZE SELECT * FROM person_discounts
WHERE person_id = 1 AND pizzeria_id = 1;

-- ВЫВОД: 
-- Index Scan using idx_person_discounts_unique on person_discounts  (cost=0.14..8.15 rows=1 width=56) (actual time=0.018..0.019 rows=1 loops=1)
--   Index Cond: ((person_id = 1) AND (pizzeria_id = 1))
-- Planning Time: 0.282 ms
-- Execution Time: 0.034 ms