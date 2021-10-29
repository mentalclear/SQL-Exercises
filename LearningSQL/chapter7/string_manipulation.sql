-- Table prep for the data
DELETE FROM string_tbl;

SELECT * FROM string_tbl;

INSERT INTO string_tbl (char_fld, vchar_fld, text_fld)
VALUES (
    'This string is 28 characters',
    'This string is 28 characters',
    'This string is 28 characters'
);


-- Here POstgreSQL removin trailing spces for char field.
SELECT LENGTH(char_fld) char_length,
LENGTH(vchar_fld) vchar_length,
LENGTH(text_fld) text_length
FROM string_tbl;

-- Substrings positions:
SELECT POSITION('characters' in vchar_fld)
FROM string_tbl;

-- Locating positions. Doesn't work for PostgreSQL
SELECT LOCATE('is', vchar_fld, 5) 
FROM string_tbl;
