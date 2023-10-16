COMMENT ON TABLE person_discounts IS 'Discount table for customers';
COMMENT ON COLUMN person_discounts.id IS 'Unique identifier (primary key)';
COMMENT ON COLUMN person_discounts.person_id IS 'Customer unique identifier (foreign key)';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Pizzeria unique identifier (foreign key)';
COMMENT ON COLUMN person_discounts.discount IS 'Customer discount';
COMMENT ON CONSTRAINT fk_person_discounts_person_id ON person_discounts IS 'Reference to the ID in the person table';
COMMENT ON CONSTRAINT fk_person_discounts_pizzeria_id ON person_discounts IS 'Reference to the ID in the person table';
COMMENT ON CONSTRAINT ch_nn_person_id ON person_discounts IS 'The person_id column must not be NULL (check)';
COMMENT ON CONSTRAINT ch_nn_pizzeria_id ON person_discounts IS 'The pizzeria_id column must not be NULL (check)';
COMMENT ON CONSTRAINT ch_nn_discount ON person_discounts IS 'The discount column must not be NULL (check)';
COMMENT ON CONSTRAINT ch_range_discount ON person_discounts IS 'The values in the discount column must be greater than zero and lower than 100 (check)';
COMMENT ON INDEX idx_person_discounts_unique IS 'The person_id and pizzeria_id fields become unique';