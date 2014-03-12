DROP TABLE blogs;
CREATE TABLE blogs (
  id SERIAL8 PRIMARY KEY,
  title TEXT,
  copy TEXT,
  author TEXT
);


INSERT INTO blogs (title, copy, author) VALUES ('Meow', 'test copy', 'jonesy');
INSERT INTO blogs (title, copy, author) VALUES ('Woof', 'test copy', 'bob');
INSERT INTO blogs (title, copy, author) VALUES ('I heart active record', 'test copy', 'alice');

