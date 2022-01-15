CREATE TABLE check_constraint_example(
    user_id BIGSERIAL,
    user_role VARCHAR(50),
    salary INTEGER,
    CONSTRAINT user_id_key PRIMARY KEY (user_id),
    CONSTRAINT check_role_in_list CHECK (user_role IN('Admin','Staff')),
    CONSTRAINT check_salary_not_zero CHECK (salary > 0)
);