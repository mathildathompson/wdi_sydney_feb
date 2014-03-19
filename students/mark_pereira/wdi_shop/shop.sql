DROP TABLE products;
CREATE TABLE products(
 id SERIAL8 PRIMARY KEY,
 product TEXT,
 name TEXT,
 price TEXT,
 description TEXT,
 price_type TEXT,
 photo TEXT
);