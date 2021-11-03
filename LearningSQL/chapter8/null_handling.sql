INSERT INTO number_tbl VALUES (1);
INSERT INTO number_tbl VALUES (3);
INSERT INTO number_tbl VALUES (5);


SELECT * FROM number_tbl;
-- By now there are 3 items in the table.

SELECT COUNT(*) num_rows,
    COUNT(val) num_vals,
    SUM(val) total,
    MAX(val) max_val,
    AVG(val) avg_val
FROM number_tbl;

-- Adding null value to the table.
INSERT INTO number_tbl VALUES (null);

-- Now rerun the above query with aggregate functions.