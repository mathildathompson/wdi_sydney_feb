DROP TABLE books;
DROP TABLE authors;
DROP TABLE authors_books;

CREATE TABLE authors (
  id SERIAL8 PRIMARY KEY,
  name TEXT,
  photo TEXT
);

CREATE TABLE books (
  id SERIAL8 PRIMARY KEY,
  title TEXT,
  cover TEXT
);

CREATE TABLE authors_books (
  author_id INT8,
  book_id INT8
);

-- INSERT INTO "authors" ("name", "photo") VALUES ("Simon Taylor","http://25.media.tumblr.com/avatar_ba75a165e333_96.png");
-- INSERT INTO "books" ("title", "cover") VALUES ("An Awesome Life","http://who-is-awesome.com/who-is-awesome.jpg");
-- INSERT INTO "authors_books" ("author_id","book_id") VALUES ((SELECT id FROM authors WHERE name = "Simon Taylor"),(SELECT id FROM books WHERE title = "An Awesome Life"));

--WAR AND PEACE IMAGE
--http://ecx.images-amazon.com/images/I/51WXbJMpcHL._BO2,204,203,200_PIsitb-sticker-arrow-click,TopRight,35,-76_SX385_SY500_CR,0,0,385,500_SH20_OU02_.jpg
