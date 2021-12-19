-- Create table and partitions for it
CREATE Table sales
(
    sale_id INT NOT NULL,
    cust_id INT NOT NULL,
    store_id INT NOT NULL,
    sale_date DATE NOT NULL,
    amount DECIMAL(9,2)
)

PARTITION BY RANGE (yearweek(sale_date))
(
    PARTITION s1 VALUES LESS THAN (202002),
    PARTITION s2 VALUES LESS THAN (202003),
    PARTITION s3 VALUES LESS THAN (202004),
    PARTITION s4 VALUES LESS THAN (202005),
    PARTITION s5 VALUES LESS THAN (202006),
    PARTITION s999 VALUES LESS THAN (MAXVALUE)
);

-- Now query that table to see those partitions
SELECT partition_name, partition_method, partition_expression
FROM information_schema.partitions
WHERE table_name = 'sales'
ORDER BY partition_ordinal_position;

-- Split the s999 partition into 3 others
ALTER TABLE sales REORGANIZE PARTITION s999 INTO 
(
    PARTITION s6 VALUES LESS THAN (202007), 
    PARTITION s7 VALUES LESS THAN (202008), 
    PARTITION s999 VALUES LESS THAN (MAXVALUE)
);

-- Add some rows to the table:
INSERT INTO sales VALUES 
    (1, 1, 1, '2020-01-18', 2765.15),
    (2, 3, 4, '2020-02-07', 5322.08);



-- Let's see where they were inserted
SELECT concat('# of rows in S1 = ', count(*)) partition_rowcount
FROM sales PARTITION (s1) UNION ALL
SELECT concat('# of rows in S2 = ', count(*)) partition_rowcount
FROM sales PARTITION (s2) UNION ALL
SELECT concat('# of rows in S3 = ', count(*)) partition_rowcount
FROM sales PARTITION (s3) UNION ALL
SELECT concat('# of rows in S4 = ', count(*)) partition_rowcount
FROM sales PARTITION (s4) UNION ALL
SELECT concat('# of rows in S5 = ', count(*)) partition_rowcount
FROM sales PARTITION (s5) UNION ALL
SELECT concat('# of rows in S6 = ', count(*)) partition_rowcount
FROM sales PARTITION (s6) UNION ALL
SELECT concat('# of rows in S7 = ', count(*)) partition_rowcount
FROM sales PARTITION (s7) UNION ALL
SELECT concat('# of rows in S999 = ', count(*)) partition_rowcount
FROM sales PARTITION (s999);