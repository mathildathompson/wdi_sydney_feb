booDROP TABLE authors;
CREATE TABLE authors (
  id SERIAL8 PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  photo TEXT
);

DROP TABLE books;
CREATE TABLE books (
  id SERIAL8 PRIMARY KEY,
  title TEXT,
  price TEXT,
  isbn TEXT,
  photo TEXT
);

DROP TABLE authors_books;
CREATE TABLE authors_books (
  author_id INT8,
  book_id INT8
);

-- seed data
INSERT INTO authors (first_name, last_name, photo) VALUES ('Harper', 'Lee', 'http://www.hollywoodreporter.com/sites/default/files/imagecache/blog_post_349_width/2013/10/harper_lee.jpg');
INSERT INTO authors (first_name, last_name, photo) VALUES ('Markus', 'Zusak', 'http://3.bp.blogspot.com/-sSTOxa4iVs0/UQmSF5bGq1I/AAAAAAAAD3A/1YqED6OrrKo/s1600/zusak.jpg');
INSERT INTO authors (first_name, last_name, photo) VALUES ('J.R.R.', 'Tolkien', 'http://img3.wikia.nocookie.net/__cb20131114153302/middleearthshadowofmordor7723/images/8/88/JRR_Tolkien.jpg');

INSERT INTO books (title, price, isbn, photo) VALUES ('To Kill A Mockingbird', '$15.95', 9780099549482, 'https://d3hgnfpzeohxco.cloudfront.net/images/ar/97800995/9780099549482/222/0/plain/to-kill-a-mockingbird.jpg');
INSERT INTO books (title, price, isbn, photo) VALUES ('The Book Thief', '$16.95', 9780099549482, 'https://d3hgnfpzeohxco.cloudfront.net/images/ar/97817435/9781743515860/222/0/plain/the-book-thief.jpg');
INSERT INTO books (title, price, isbn, photo) VALUES ('Lord Of The Rings', '$19.95', 9780261103252, 'https://d3hgnfpzeohxco.cloudfront.net/images/ar/97802611/9780261103252/222/0/plain/the-lord-of-the-rings.jpg');

INSERT INTO authors_books (author_id, book_id) VALUES (1, 1);
INSERT INTO authors_books (author_id, book_id) VALUES (2, 2);
INSERT INTO authors_books (author_id, book_id) VALUES (3, 3);
