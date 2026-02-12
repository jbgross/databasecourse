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
CREATE TABLE (
  ...
);

-- =========================================================
-- Part B: Create the Book table
-- =========================================================
-- Create a table named `book` with:
-- - an author ID (required, references author)
-- - a title (required)
-- - an ISBN (required)
-- - a page length (required, positive)
-- Write SQL here.

-- =========================================================
-- Part C: Insert sample authors and books
-- =========================================================
-- Add 3 authors:
-- - Mateo Alvarez
-- - Daphne Rowe
-- - Elliot Mercer
-- Write SQL here.
-- Student check:
-- Write a SELECT query to review the 3 newly added authors.
-- Write SQL here.
INSERT INTO ...;

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

-- Write SQL here for the remaining 5 book INSERT statements.
-- Student check:
-- Write a SELECT query to review all newly added books.
-- Write SQL here.

-- =========================================================
-- Part D: Update existing data
-- =========================================================
-- Exercise 1:
-- Change Elliot Mercer's name to Eliot Mercer
-- (single "l" in Eliot).
-- Write SQL here.

-- Exercise 2:
-- Update all of Daphne Rowe's books to add 100 pages
-- to the current page_length.
-- Write SQL here.

-- Student check:
-- Write SELECT queries to confirm both updates.
-- Write SQL here.

-- =========================================================
-- Part E: Delete data by condition
-- =========================================================
-- Exercise:
-- Delete all books with more than 350 pages.
-- Write SQL here.

-- Student check:
-- Write a SELECT query to verify that no books over 350 pages remain.
-- Write SQL here.
