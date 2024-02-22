CREATE INDEX idx_person_name ON person (UPPER(name));
-- SELECT * FROM pg_indexes WHERE indexname = 'idx_person_name';
SET ENABLE_SEQSCAN TO OFF;
EXPLAIN ANALYZE SELECT person.name FROM person WHERE UPPER(person.name) = 'KATE';

-- SET ENABLE_SEQSCAN TO OFF; - отключение последовательного и включение идексированного сканирования