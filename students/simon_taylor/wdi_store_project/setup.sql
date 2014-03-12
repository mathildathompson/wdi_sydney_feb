DROP TABLE products;

CREATE TABLE products (
  id INTEGER PRIMARY KEY,
  name TEXT,
  price REAL,
  sale INTEGER
);

INSERT INTO products (name, price, sale) VALUES ('Stapler',7.99,0);
INSERT INTO products (name, price, sale) VALUES ('Binder',1.99,1);
INSERT INTO products (name, price, sale) VALUES ('Pencil',0.50,0);