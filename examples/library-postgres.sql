DROP TABLE IF EXISTS checkout1;
DROP TABLE IF EXISTS checkout2;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS patron;

CREATE TABLE book (
   book_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
   title VARCHAR(64) NOT NULL
);

CREATE TABLE patron (
  patron_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(64) NOT NULL
);

CREATE TABLE checkout1 (
    book_id INT,
    patron_id INT,
    PRIMARY KEY (book_id, patron_id),
    FOREIGN KEY (book_id) REFERENCES book (book_id),
    FOREIGN KEY (patron_id) REFERENCES patron (patron_id)
);

CREATE TABLE checkout2 (
  book_id INT,
  patron_id INT,
  checkout_id INT GENERATED ALWAYS AS IDENTITY,
  PRIMARY KEY (book_id, patron_id, checkout_id),
  FOREIGN KEY (book_id) REFERENCES book (book_id),
  FOREIGN KEY (patron_id) REFERENCES patron (patron_id)
);

