CREATE INDEX idx_menu_pizzeria_id ON menu USING BTREE (pizzeria_id);
CREATE INDEX idx_person_order_person_id ON person_order USING BTREE (person_id);
CREATE INDEX idx_person_order_menu_id ON person_order USING BTREE (menu_id);
CREATE INDEX idx_person_visits_person_id ON person_visits USING BTREE (person_id);
CREATE INDEX idx_person_visits_pizzeria_id ON person_visits USING BTREE (pizzeria_id);