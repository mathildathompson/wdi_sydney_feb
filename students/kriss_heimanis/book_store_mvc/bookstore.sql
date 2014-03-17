DROP TABLE books;
CREATE TABLE books (
  id SERIAL8 PRIMARY KEY,
  name TEXT,
  blurb TEXT,
  year INT4,
  rating INT2,
  price INT8,
  image TEXT
);
DROP TABLE author;
CREATE TABLE authors (
  id SERIAL8 PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  yob INT4
);
DROP TABLE borrower;
CREATE TABLE borrowers (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(25),
  last_name VARCHAR(25)
);
DROP TABLE authors_books;
CREATE TABLE authors_books (
  author_id INT8,
  book_id INT8
);
DROP TABLE books_borrowers;
CREATE TABLE books_borrowers (
  book_id INT8,
  borrower_id INT8
);