DROP TABLE authors;
CREATE TABLE authors(
	id SERIAL8 PRIMARY KEY,
	first_name TEXT,
	last_name TEXT
);

DROP TABLE books;
CREATE TABLE books(
	id SERIAL8 PRIMARY KEY,
	title TEXT,
	description TEXT,
	cover TEXT
);

DROP TABLE authors_books;
CREATE TABLE authors_books(
	author_id INT8,
	book_id INT8
);

INSERT INTO authors(first_name, last_name) VALUES('Joanne', 'Rowling');
INSERT INTO authors(first_name, last_name) VALUES('Stephen', 'King');

INSERT INTO books(title, description, cover) VALUES('Harry Potter and the Goblet of Fire', 'Magic stuff', 'http://www.bookbunnys.com/wp-content/uploads/2013/11/Harry-Potter-and-the-Goblet-of-Fire.jpg');

INSERT INTO authors_books(author_id, book_id) VALUES(1,1); 