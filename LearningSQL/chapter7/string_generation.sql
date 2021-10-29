CREATE TABLE string_tbl
(
    char_fld CHAR(30),
    vchar_fld VARCHAR(30),
    text_fld TEXT
);

SELECT * FROM string_tbl;

-- String generation
INSERT INTO string_tbl (char_fld, vchar_fld, text_fld)
VALUES (
    'This is char data',
    'This is varchar data',
    'This is text data'
);

-- Attempting to update vchar_fld with 46 chars.
UPDATE string_tbl
SET vchar_fld = 'This is a piece of extremely long varchar data';

-- Check what mode we are in, doesn't work in PostgreSQL
SELECT @@session.sql_mode;

-- Sets mode to ANSI and the exess of a string will be truncated.
SET sql_mode='ansi';

-- This doesn't work in PostgreSQL
SHOW WARNINGS;

-- Include Single quotes
UPDATE string_tbl
SET text_fld = 'This string didn''t work, but works now';

-- Direct output should be handled Ok anyways.
SELECT text_fld FROM string_tbl;

-- quote() function to escape possible character problems
-- Doesn't work in PostgreSQL
SELECT quote(text_fld) FROM string_tbl;

-- The approach that may work
SELECT quote_literal(text_fld) FROM string_tbl;


