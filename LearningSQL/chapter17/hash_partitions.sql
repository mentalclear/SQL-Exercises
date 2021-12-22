CREATE TABLE sales_hash
(
    sale_id INT NOT NULL,
    cust_id INT NOT NULL,
    store_id INT NOT NULL,
    sale_date DATE NOT NULL,
    amoutn DECIMAL(9,2)
)
PARTITION BY HASH(cust_id)
    PARTITIONS 4
    (
        PARTITION H1,
        PARTITION H2,
        PARTITION H3,
        PARTITION H4
    );

-- No all insertions will be distributed between the partitions
INSERT INTO sales_hash
 VALUES
  (1, 1, 1, '2020-01-18', 1.1), (2, 3, 4, '2020-02-07', 1.2),
  (3, 17, 5, '2020-01-19', 1.3), (4, 23, 2, '2020-02-08', 1.4),
  (5, 56, 1, '2020-01-20', 1.6), (6, 77, 5, '2020-02-09', 1.7),
  (7, 122, 4, '2020-01-21', 1.8), (8, 153, 1, '2020-02-10', 1.9),
  (9, 179, 5, '2020-01-22', 2.0), (10, 244, 2, '2020-02-11', 2.1),
  (11, 263, 1, '2020-01-23', 2.2), (12, 312, 4, '2020-02-12', 2.3),
  (13, 346, 2, '2020-01-24', 2.4), (14, 389, 3, '2020-02-13', 2.5),
  (15, 472, 1, '2020-01-25', 2.6), (16, 502, 1, '2020-02-14', 2.7);

SELECT * FROM sales_hash;

SELECT concat('# of rows in H1 = ', count(*)) partition_rowcount
FROM sales_hash PARTITION (h1) UNION ALL
SELECT concat('# of rows in H2 = ', count(*)) partition_rowcount
FROM sales_hash PARTITION (h2) UNION ALL
SELECT concat('# of rows in H3 = ', count(*)) partition_rowcount
FROM sales_hash PARTITION (h3) UNION ALL
SELECT concat('# of rows in H4 = ', count(*)) partition_rowcount
FROM sales_hash PARTITION (h4);