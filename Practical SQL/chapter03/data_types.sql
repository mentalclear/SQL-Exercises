CREATE TABLE eagle_watch (
    observed_date date,
    eagles_seen integer
);


CREATE TABLE char_data_types (
    varchar_column VARCHAR(10),
    char_column CHAR(10),
    text_column TEXT
);

INSERT INTO char_data_types
VALUES
('abc','abc','abc'),
('defghi','defghi','defghi');

COPY char_data_types TO '/tmp/typetest.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');

CREATE TABLE people (
    id SERIAL,
    person_name VARCHAR(100)
)