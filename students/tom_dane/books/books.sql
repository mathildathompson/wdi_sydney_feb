DROP TABLE books;
CREATE TABLE books(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(25) 
   );

DROP TABLE authors;
CREATE TABLE authors(
  id SERIAL8 PRIMARY KEY,
  name TEXT
  );

DROP TABLE authors_books;
CREATE TABLE authors_books (
  author_id INT8,
  book_id INT8
);

-- seed data
INSERT INTO books (title) VALUES ('Never Let Me Go');
INSERT INTO books (title) VALUES ('War and Peace');
INSERT INTO books (title) VALUES ('Grapes of Wrath');
INSERT INTO books (title) VALUES ('Fantasy Colab');
INSERT INTO books (title) VALUES ('Anna Karenina');

INSERT INTO authors (name) VALUES ('Ishiguro');
INSERT INTO authors (name) VALUES ('Tolstoy');
INSERT INTO authors (name) VALUES ('Steinbeck');

INSERT INTO authors_books (author_id, book_id) VALUES (1, 1);
INSERT INTO authors_books (author_id, book_id) VALUES (2, 2);
INSERT INTO authors_books (author_id, book_id) VALUES (3, 3);
INSERT INTO authors_books (author_id, book_id) VALUES (2, 4);
INSERT INTO authors_books (author_id, book_id) VALUES (2, 5);
INSERT INTO authors_books (author_id, book_id) VALUES (3, 4);
