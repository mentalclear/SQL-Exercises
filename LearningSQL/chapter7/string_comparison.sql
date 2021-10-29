DELETE FROM string_tbl;

INSERT INTO string_tbl(vchar_fld)
VALUES ('abcd'),
('xyz'),
('QRSTUV'),
('qrstuv'),
('12345');

SELECT st.vchar_fld vc 
FROM string_tbl st
ORDER BY st.vchar_fld;

-- Not working in PostgreSQL
SELECT STRCMP('12345','12345') 12345_12345,
STRCMP('abcd','xyz') abcd_xyz,
STRCMP('abcd','QRSTUV') abcd_QRSTUV,
STRCMP('qrstuv','QRSTUV') qrstuv_QRSTUV,
STRCMP('12345','xyz') 12345_xyz,
STRCMP('xyz','qrstuv') xyz_qrstuv;

-- Switch to sakila here. Manually in PostgreSQL

-- Returns true or false
SELECT name, name LIKE '%y' ends_in_y
FROM category;


-- Regexp
SELECT name, name SIMILAR TO '[A-Za-z]+y' ends_in_y
FROM category;
