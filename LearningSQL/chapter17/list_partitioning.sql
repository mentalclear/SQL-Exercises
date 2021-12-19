CREATE TABLE sales_new 
(
    sale_id INT NOT NULL,
    cust_id INT NOT NULL,
    store_id INT NOT NULL,
    sale_date DATE NOT NULL,
    geo_region_cd VARCHAR(6) NOT NULL,
    amount DECIMAL(9,2)
)
PARTITION BY LIST COLUMNS (geo_region_cd)
(
    PARTITION NORTHAMERICA VALUES IN ('US_NE','US_SE','US_MW',
                                     'US_NW','US_SW','CAN','MEX'),
    PARTITION EUROPE VALUES IN ('EUR_E','EUR_W'),
    PARTITION ASIA VALUES IN ('CHN','JPN','IND')
);

-- Generates error due to 'KOR' bot being a part on ASIA partition ^^^
INSERT INTO sales_new
VALUES
  (1, 1, 1, '2020-01-18', 'US_NE', 2765.15),
  (2, 3, 4, '2020-02-07', 'CAN', 5322.08),
  (3, 6, 27, '2020-03-11', 'KOR', 4267.12);


-- After this the ^^^^ will work!
ALTER Table sales_new REORGANIZE PARTITION ASIA INTO
(
    PARTITION ASIA VALUES IN ('CHN','JPN','IND', 'KOR')
);

-- Check the metadata just in case:
SELECT partition_name, partition_expression, partition_description
FROM information_schema.partitions
WHERE table_name = "sales_new"
ORDER BY partition_ordinal_position;