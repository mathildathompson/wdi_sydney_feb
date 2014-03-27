CREATE TABLE blogs(
  id SERIAL8 PRIMARY KEY,
  title TEXT,
  copy TEXT,
  mood TEXT,
  current_plaything TEXT,
  author TEXT,
  image TEXT
);

INSERT INTO blogs (title, copy, mood, current_plaything, author, image) VALUES ('Post #1', 'This is the first post for testing.', 'confused', 'active record', 'Kriss', 'img here');