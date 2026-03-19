DROP TABLE IF EXISTS tableA;

CREATE TABLE tableA (
    col1 INTEGER PRIMARY KEY,
    col2 INTEGER NOT NULL,
    col3 INTEGER NOT NULL
);

INSERT INTO tableA (col1, col2, col3)
VALUES
    (1, 10, 5),
    (2, 20, 4),
    (3, 30, 3),
    (4, 30, 4);

DROP TABLE IF EXISTS tableB;

CREATE TABLE tableB (
    col4 INTEGER PRIMARY KEY,
    col5 INTEGER NOT NULL,
    col6 INTEGER NOT NULL
);

INSERT INTO tableB (col4, col5, col6)
VALUES
    (1, 10, 5),
    (2, 10, 5),
    (3, 30, 3),
    (4, 40, 2);
