CREATE TABLE new_york_addresses (
    longitude numeric(9,6),
    latitude numeric(9,6),
    street_number varchar(10),
    street varchar(32),
    unit varchar(7),
    postcode varchar(5),
    id integer CONSTRAINT new_york_key PRIMARY KEY
);

-- Make take some long time... DB is 50Mb in size.
SELECT * FROM new_york_addresses;

-- Execution time insights:


EXPLAIN ANALYZE SELECT * FROM new_york_addresses 
WHERE street = 'BROADWAY';
-- Before Index
--  Planning Time: 1.090 ms
--  Execution Time: 65.424 ms
-- After:
--  Planning Time: 0.668 ms
--  Execution Time: 29.153 ms


EXPLAIN ANALYZE SELECT * FROM new_york_addresses
WHERE street = '52 STREET';
--Before Index
-- Planning Time: 0.150 ms
-- Execution Time: 63.924 ms
--After:
-- Planning Time: 0.170 ms
-- Execution Time: 12.311 ms



EXPLAIN ANALYZE SELECT * FROM new_york_addresses
WHERE street = 'ZWICKY AVENUE';
--Before Index
-- Planning Time: 0.150 ms
-- Execution Time: 63.924 ms
--After
-- Planning Time: 0.168 ms
-- Execution Time: 0.321 ms



-- Creating an INDEX 
CREATE INDEX street_idx ON new_york_addresses (street);