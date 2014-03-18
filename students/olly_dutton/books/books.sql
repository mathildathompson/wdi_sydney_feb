DROP TABLE books;
CREATE TABLE books (
    id SERIAL8 PRIMARY KEY,
    title TEXT,
    photo TEXT,
    genre TEXT
);

DROP TABLE authors;
CREATE TABLE authors (
    id SERIAL8 PRIMARY KEY,
    name TEXT,
    photo TEXT
); 

DROP TABLE authors_books;
CREATE TABLE authors_books (
    author_id INT8,
    book_id INT8
); 

INSERT INTO books (title, photo) VALUES ("Hell's Angels", "http://www.beatdom.com/wp-content/uploads/2013/09/Hells-Angels.jpg");
INSERT INTO books (title, photo) VALUES ("Rubber Johnny", "http://ecx.images-amazon.com/images/I/61%2BB5gPmYiL._SL500_.jpg");

INSERT INTO authors (name, photo) VALUES ("Hunter S. Thompson", "http://www.phrases.org.uk/quotes/last-words/images/hunter-s-thompson.jpg");
INSERT INTO authors (name, photo) VALUES ("Chris Cunningham", "http://2011.sonar.es/uploads/images/ci1242_3320_chris_cunningham1.jpg");

INSERT INTO authors_books (author_id, book_id) VALUES (1, 1);
INSERT INTO authors_books (author_id, book_id) VALUES (2, 2);
