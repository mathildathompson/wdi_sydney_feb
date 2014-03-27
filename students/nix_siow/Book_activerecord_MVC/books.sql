DROP TABLE books;
CREATE TABLE books (
  id SERIAL8 PRIMARY KEY,
  title TEXT,
  photo TEXT,
  isbn  TEXT
);

DROP TABLE authors;
CREATE TABLE authors (
  id SERIAL8 PRIMARY KEY,
  name TEXT
);

DROP TABLE authors_books;
CREATE TABLE authors_books (
  author_id INT8,
  book_id INT8
);