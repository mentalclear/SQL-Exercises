CREATE TABLE number_data_types (
    numeric_column NUMERIC(20,5),
    real_column REAL,
    double_column DOUBLE PRECISION
);

INSERT INTO number_data_types
VALUES
(.7,.7,.7),
(2.13579, 2.13579, 2.13579),
(2.1357987654, 2.1357987654, 2.1357987654);

SELECT * FROM "number_data_types";

-- Problems with math

SELECT numeric_column * 10000000 AS "Fixed",
         real_column * 10000000 AS "Float"
FROM number_data_types
WHERE numeric_column =.7;