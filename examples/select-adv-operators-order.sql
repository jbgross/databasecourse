DROP TABLE IF EXISTS foo;

CREATE TABLE foo (
    a INT NOT NULL PRIMARY KEY,
    b CHAR(1) NULL,
    c CHAR(1) NULL
);

INSERT INTO FOO (a, b, c)
VALUES
   (0, NULL, NULL),
   (1, 'x', NULL),
   (2, 'y', 'y'),
   (3, 'z', 'w');

SELECT * FROM foo;

SELECT * FROM FOO
WHERE b = NULL;

SELECT * FROM FOO
WHERE b != NULL;

SELECT * FROM FOO
WHERE b = c;


SELECT * FROM FOO
WHERE b != c;

SELECT * FROM FOO
WHERE c IS NULL;

SELECT * FROM FOO
WHERE c IS NOT NULL;

DROP TABLE IF EXISTS bar;

CREATE TABLE bar (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(16) NOT NULL
);

INSERT INTO bar (id, name)
VALUES
   (0, 'Joshua'),
   (1, 'JOSHUA'),
   (2, 'Ja'),
   (3, 'Jaa');

SELECT * FROM bar;

SELECT * FROM bar
WHERE name LIKE 'J_a';

SELECT * FROM bar
WHERE name LIKE 'J%a';

SELECT * FROM bar
WHERE name LIKE '___';

SELECT * FROM bar
WHERE name LIKE '___%';

DROP TABLE IF EXISTS quux;
CREATE TABLE quux (
    id INT NOT NULL PRIMARY KEY,
    word VARCHAR(16) NOT NULL
);

CREATE TABLE grault (
    a INT NOT NULL PRIMARY KEY,
    b VARCHAR(8) NOT NULL
);

INSERT INTO grault (a, b)
VALUES
   (0, 'hello'),
   (1, 'goodbye'),
   (4, 'hello'),
   (5, 'HELLO');

SELECT * FROM grault
WHERE a IN (1, 3, 5);

SELECT * FROM grault
WHERE b IN ('hello', 'goodbye');

INSERT INTO quux (id, word)
VALUES
   (0, 'Abel'),
   (5, 'Baker'),
   (4, 'Baker'),
   (2, 'baker'),
   (3, 'Baste');

SELECT * FROM QUUX
ORDER BY id; -- ASC is optional

SELECT * FROM QUUX
ORDER BY word DESC;

SELECT * FROM QUUX
ORDER BY word DESC, id ;