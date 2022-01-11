CREATE TABLE natural_key_example (
    license_id VARCHAR(10) CONSTRAINT license_key PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

SELECT * FROM "natural_key_example";

DROP TABLE natural_key_example;

CREATE TABLE natural_key_example (
    license_id VARCHAR(10),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    CONSTRAINT license_key PRIMARY KEY (license_id)
);

SELECT * FROM "natural_key_example";

INSERT INTO natural_key_example (license_id, first_name, last_name)
VALUES ('T229901', 'Lynn', 'Malero');

INSERT INTO natural_key_example (license_id, first_name, last_name)
VALUES ('T229901', 'Sam', 'Tracy');


-- Natural key composite example
CREATE TABLE natural_key_composite_example (
    student_id VARCHAR(10),
    school_day DATE,
    present BOOLEAN,
    CONSTRAINT student_key PRIMARY KEY (student_id, school_day)
);

INSERT INTO natural_key_composite_example (student_id, school_day, present)
VALUES(775, '1/22/2017', 'Y');

INSERT INTO natural_key_composite_example (student_id, school_day, present)
VALUES(775, '1/23/2017', 'Y');

-- This one causes an error
INSERT INTO natural_key_composite_example (student_id, school_day, present)
VALUES(775, '1/23/2017', 'N');

SELECT * FROM "natural_key_composite_example";

-- Self incremential surrogate key
CREATE TABLE surrogate_key_example (
    order_nnumber BIGSERIAL,
    product_name VARCHAR(50),
    order_date DATE,
    CONSTRAINT order_key PRIMARY KEY (order_nnumber)
);

DROP TABLE surrogate_key_example;

INSERT INTO surrogate_key_example (product_name, order_date)
VALUES ('Beachball Polish', '2015-03-17'),
('Wrinkle De-Atomizer', '2017-05-22'),
('Flux Capacitor', '1985-10-26');

SELECT * FROM surrogate_key_example;