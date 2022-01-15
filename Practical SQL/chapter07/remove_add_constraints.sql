-- Dropping a constraint
ALTER TABLE not_null_example ALTER COLUMN first_name DROP NOT NULL;

-- Adding a constraint
ALTER TABLE not_null_example ALTER COLUMN first_name SET NOT NULL;
