-- third-resolved-mysql.sql
-- Resolves the 3NF issue by moving title -> salary into job_title.
-- Still violates BCNF because trainer_name -> certification_name in employee_training.

CREATE DATABASE IF NOT EXISTS normalization;
USE normalization;

DROP TABLE IF EXISTS child;
DROP TABLE IF EXISTS employee_training;
DROP TABLE IF EXISTS job_title;
DROP TABLE IF EXISTS employee;

CREATE TABLE job_title (
    title VARCHAR(16) PRIMARY KEY,
    salary DECIMAL(10, 2) NOT NULL
);

CREATE TABLE employee (
    employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(16) NOT NULL,
    last_name VARCHAR(16) NOT NULL,
    dob DATE NOT NULL,
    title VARCHAR(16) NOT NULL,
    FOREIGN KEY (title) REFERENCES job_title (title)
) AUTO_INCREMENT = 1000;

CREATE TABLE child (
    employee_id INT NOT NULL,
    birth_order INT NOT NULL,
    first_name VARCHAR(16) NOT NULL,
    PRIMARY KEY (employee_id, birth_order),
    FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
);

CREATE TABLE employee_training (
    employee_id INT NOT NULL,
    certification_name VARCHAR(16) NOT NULL,
    trainer_name VARCHAR(16) NOT NULL,
    PRIMARY KEY (employee_id, certification_name),
    UNIQUE (employee_id, trainer_name),
    FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
);

INSERT INTO job_title (title, salary)
VALUES
    ('Analyst', 65000.00),
    ('Manager', 90000.00);

INSERT INTO employee (employee_id, first_name, last_name, dob, title)
VALUES
    (1000, 'Alice', 'Nguyen', '1988-04-12', 'Analyst'),
    (1001, 'Brian', 'Nguyen', '1985-09-03', 'Analyst'),
    (1002, 'Carla', 'Lopez', '1990-01-21', 'Manager'),
    (1003, 'Darius', 'Patel', '1987-07-19', 'Analyst'),
    (1004, 'Elena', 'Martinez', '1992-11-08', 'Manager'),
    (1005, 'Farah', 'Khan', '1989-02-14', 'Analyst'),
    (1006, 'Gavin', 'Brooks', '1983-05-27', 'Manager'),
    (1007, 'Helena', 'Wright', '1991-08-30', 'Analyst');

INSERT INTO child (employee_id, birth_order, first_name)
VALUES
    (1000, 1, 'Evan'),
    (1000, 2, 'Mia'),
    (1001, 1, 'Noah'),
    (1002, 1, 'Sofia'),
    (1002, 2, 'Lucas'),
    (1003, 1, 'Ava'),
    (1003, 2, 'Rohan'),
    (1004, 1, 'Mateo'),
    (1004, 2, 'Camila'),
    (1004, 3, 'Isla'),
    (1005, 1, 'Zara'),
    (1005, 2, 'Omar'),
    (1006, 1, 'Liam'),
    (1006, 2, 'Chloe'),
    (1006, 3, 'Nora'),
    (1007, 1, 'Eli'),
    (1007, 2, 'Grace');

INSERT INTO employee_training (employee_id, certification_name, trainer_name)
VALUES
    (1000, 'SQL Fundamentals', 'Jordan Blake'),
    (1001, 'Data Governance', 'Casey Reed'),
    (1002, 'Team Leadership', 'Morgan Hale'),
    (1003, 'SQL Fundamentals', 'Jordan Blake'),
    (1004, 'Team Leadership', 'Morgan Hale'),
    (1005, 'Data Governance', 'Casey Reed'),
    (1006, 'Team Leadership', 'Morgan Hale'),
    (1007, 'SQL Fundamentals', 'Jordan Blake');
