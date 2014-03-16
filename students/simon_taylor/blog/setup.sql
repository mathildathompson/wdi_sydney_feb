DROP TABLE posts;

CREATE TABLE posts (
 id SERIAL8 PRIMARY KEY,
 title TEXT, 
 copy TEXT,
 mood TEXT,
 author TEXT,
 photo TEXT
);