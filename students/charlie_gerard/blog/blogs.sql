DROP TABLE blogs;
CREATE TABLE blogs(
	id SERIAL8 PRIMARY KEY,
	title TEXT,
	copy TEXT,
	author TEXT,
	image TEXT
);