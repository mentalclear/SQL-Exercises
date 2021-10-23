-- List all avaialbe encodings
SELECT DISTINCT pg_catalog.pg_encoding_to_char(conforencoding)
from pg_catalog.pg_conversion;