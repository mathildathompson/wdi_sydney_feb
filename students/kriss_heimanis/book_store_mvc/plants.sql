CREATE TABLE plants (
  id SERIAL8 PRIMARY KEY,
  name TEXT,
  latin_name TEXT,
  region TEXT,
  photo TEXT
);

ALTER TABLE butterflies ADD COLUMN plant_id INT8;