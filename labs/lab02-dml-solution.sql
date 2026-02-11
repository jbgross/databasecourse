-- Lab: Create an Author/Book Database in PostgreSQL
--
-- Instructions:
-- 1) Open pgAdmin 4.
-- 2) In the Browser panel, right-click "Databases" and choose "Create" > "Database...".
-- 3) Name the database `author_book_lab` and click "Save".
-- 4) Click the new database `author_book_lab` to select it.
-- 5) Open the Query Tool (right-click the database, then "Query Tool").
-- 6) Copy/paste the SQL below into the Query Tool and run it.

-- =========================================================
-- Part A: Create the Author table
-- =========================================================
-- Create a table named `author` with:
-- - a generated ID
-- - the author's name (required)
CREATE TABLE author (
  author_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  author_name VARCHAR(200) NOT NULL
);

-- =========================================================
-- Part B: Create the Book table
-- =========================================================
-- Create a table named `book` with:
-- - an author ID (required, references author)
-- - a title (required)
-- - an ISBN (required)
-- - a page length (required, positive)
CREATE TABLE book (
  book_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  author_id INTEGER NOT NULL,
  title VARCHAR(300) NOT NULL,
  isbn VARCHAR(20) NOT NULL,
  page_length INTEGER NOT NULL CHECK (page_length > 0),
  CONSTRAINT fk_book_author
    FOREIGN KEY (author_id)
    REFERENCES author(author_id)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

-- =========================================================
-- Part C: Verify your tables
-- =========================================================
-- Run these to confirm the tables exist:
-- \dt
-- SELECT * FROM author;
-- SELECT * FROM book;
