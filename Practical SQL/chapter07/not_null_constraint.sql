CREATE TABLE not_null_example (
    student_id bigserial,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    CONSTRAINT student_id_key PRIMARY KEY (student_id)
);

-- This will trigger an error since last name and first name cannot be null
INSERT INTO not_null_example VALUES 
(2);

ALTER TABLE not_null_example ALTER COLUMN first_name DROP NOT NULL;

SELECT * FROM not_null_example;

UPDATE not_null_example
SET first_name = 'Vasya', last_name='Pupkin'
WHERE student_id=2;