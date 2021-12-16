-- Exercise 15-1
SELECT DISTINCT table_name, index_name
FROM information_schema.statistics
WHERE table_schema = 'sakila';

-- Exercise 15-2

WITH idx_info AS
(SELECT s1.table_name, s1.index_name, 
     s1.column_name, s1.seq_in_index,
(SELECT max(s2.seq_in_index) 
      FROM information_schema.statistics s2
 WHERE s2.table_schema = s1.table_schema
 AND s2.table_name = s1.table_name
  AND s2.index_name = s1.index_name) num_columns
FROM information_schema.statistics s1
WHERE s1.table_schema = 'sakila'
AND s1.table_name = 'customer'
)
 SELECT concat(
 CASE
 WHEN seq_in_index = 1 THEN
 concat('ALTER TABLE ', table_name, ' ADD INDEX ', 
              index_name, ' (', column_name)
ELSE concat('  , ', column_name)
END,
CASE
 WHEN seq_in_index = num_columns THEN ');'
 ELSE ''
 END
 ) index_creation_statement
 FROM idx_info
 ORDER BY index_name, seq_in_index;