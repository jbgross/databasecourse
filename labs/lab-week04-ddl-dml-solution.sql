-- Lab: Create an Author/Book Database in PostgreSQL
--
-- Instructions:
-- 1) Open pgAdmin 4.
-- 2) In the Browser panel, right-click "Databases" and choose "Create" > "Database...".
-- 3) Name the database `author_book_lab` and click "Save".
-- 4) Click the new database `author_book_lab` to select it.
-- 5) Open the Query Tool (right-click the database, then "Query Tool").
-- 6) Copy/paste the SQL below into the Query Tool and run it.

-- Reset tables so the script can be re-run safely.
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS author;

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
-- Part C: Insert sample authors and books
-- =========================================================
-- Add 3 authors:
-- - Mateo Alvarez
-- - Daphne Rowe
-- - Elliot Mercer
INSERT INTO author (author_name) VALUES
  ('Mateo Alvarez'),
  ('Daphne Rowe'),
  ('Elliot Mercer');
-- Student check:
-- Write a SELECT query to review the 3 newly added authors.
SELECT *
FROM author;

-- Add 2 books for each author.
-- Book data table:
-- | Title                           | Author         | ISBN              | Page Count |
-- |---------------------------------|----------------|-------------------|------------|
-- | Lanterns Over Cobalt Harbor     | Mateo Alvarez  | 978-1-84372-610-9 | 312        |
-- | The Cartographer's Last Compass | Mateo Alvarez  | 978-1-84372-644-4 | 287        |
-- | Winter Circuit                  | Daphne Rowe    | 978-1-95384-221-6 | 264        |
-- | Glass Orchard                   | Daphne Rowe    | 978-1-95384-245-2 | 338        |
-- | The Silent Observatory          | Elliot Mercer  | 978-1-66721-108-9 | 301        |
-- | A Theory of Vanishing Roads     | Elliot Mercer  | 978-1-66721-134-8 | 356        |
-- Example with an embedded query for author_id:
INSERT INTO book (author_id, title, isbn, page_length) VALUES
  ((SELECT author_id FROM author WHERE author_name = 'Mateo Alvarez'), 'Lanterns Over Cobalt Harbor', '978-1-84372-610-9', 312);

INSERT INTO book (author_id, title, isbn, page_length) VALUES
  ((SELECT author_id FROM author WHERE author_name = 'Mateo Alvarez'), 'The Cartographer''s Last Compass', '978-1-84372-644-4', 287);

INSERT INTO book (author_id, title, isbn, page_length) VALUES
  ((SELECT author_id FROM author WHERE author_name = 'Daphne Rowe'), 'Winter Circuit', '978-1-95384-221-6', 264);

INSERT INTO book (author_id, title, isbn, page_length) VALUES
  ((SELECT author_id FROM author WHERE author_name = 'Daphne Rowe'), 'Glass Orchard', '978-1-95384-245-2', 338);

INSERT INTO book (author_id, title, isbn, page_length) VALUES
  ((SELECT author_id FROM author WHERE author_name = 'Elliot Mercer'), 'The Silent Observatory', '978-1-66721-108-9', 301);

INSERT INTO book (author_id, title, isbn, page_length) VALUES
  ((SELECT author_id FROM author WHERE author_name = 'Elliot Mercer'), 'A Theory of Vanishing Roads', '978-1-66721-134-8', 356);
-- Student check:
-- Write a SELECT query to review all newly added books.
SELECT *
FROM book;

-- =========================================================
-- Part D: Update existing data
-- =========================================================
-- Exercise 1:
-- Change Elliot Mercer's name to Eliot Mercer
-- (single "l" in Eliot).
UPDATE author
SET author_name = 'Eliot Mercer'
WHERE author_name = 'Elliot Mercer';

-- Exercise 2:
-- Update all of Daphne Rowe's books to add 100 pages
-- to the current page_length.
UPDATE book
SET page_length = page_length + 100
WHERE author_id = (
  SELECT author_id
  FROM author
  WHERE author_name = 'Daphne Rowe'
);
-- Student check:
-- Write SELECT queries to confirm both updates.
SELECT *
FROM book;
SELECT *
FROM author;

-- =========================================================
-- Part E: Delete data by condition
-- =========================================================
-- Exercise:
-- Delete all books with more than 350 pages.
DELETE FROM book
WHERE page_length > 350;

-- Student check:
-- Write a SELECT query to verify that no books over 350 pages remain.
SELECT *
FROM book;
