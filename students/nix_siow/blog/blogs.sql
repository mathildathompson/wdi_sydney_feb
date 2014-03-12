DROP TABLE blogs;
CREATE TABLE blogs (
    id SERIAL8 PRIMARY KEY,
    title TEXT,
    content TEXT,
    photo TEXT,
    mood TEXT
);