USE test1;

CREATE TABLE category (
 category_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
 name VARCHAR(25) NOT NULL,
 last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP 
   ON UPDATE CURRENT_TIMESTAMP,
 PRIMARY KEY (category_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

SELECT * FROM category;


SELECT tbl.table_name,
 (SELECT count(*) FROM information_schema.columns clm
  WHERE clm.table_schema = tbl.table_schema
    AND clm.table_name = tbl.table_name) num_columns,
 (SELECT count(*) FROM information_schema.statistics sta
  WHERE sta.table_schema = tbl.table_schema
    AND sta.table_name = tbl.table_name) num_indexes,
 (SELECT count(*) FROM information_schema.table_constraints tc
  WHERE tc.table_schema = tbl.table_schema
    AND tc.table_name = tbl.table_name
    AND tc.constraint_type = 'PRIMARY KEY') num_primary_keys
FROM information_schema.tables tbl
WHERE tbl.table_schema = 'sakila' AND tbl.table_type = 'BASE TABLE'
ORDER BY 1;