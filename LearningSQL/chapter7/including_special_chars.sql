-- Doesn't work in the PostgreSQL
SELECT 'abcdefg', CHAR(97,98,99,100,101,102,103);

-- PostgreSQL version:
SELECT 'abcdefg', 
CHR(97) || CHR(98) || CHR(99) || CHR(100) || CHR(101) || CHR(102) || CHR(103);


SELECT CHR(148);

SHOW client_encoding;

-- Concat example
SELECT CONCAT('Danke sch', CHR(246),'n');

-- This should work too
SELECT 'Danke sch' || CHR(246) || 'n';

SELECT ASCII('ö');