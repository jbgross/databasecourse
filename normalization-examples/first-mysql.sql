-- first-mysql.sql
-- Unnormalized starting point:
-- 1NF violation: child data is stored in repeating fixed columns inside employee.
-- 3NF violation: title -> salary.
-- BCNF violation (carried through later versions): trainer_name -> certification_name
-- in employee_training, where the candidate keys are
-- (employee_id, certification_name) and (employee_id, trainer_name).

CREATE DATABASE IF NOT EXISTS normalization;
USE normalization;

DROP TABLE IF EXISTS employee_training;
DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
    employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(16) NOT NULL,
    last_name VARCHAR(16) NOT NULL,
    dob DATE NOT NULL,
    title TEXT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    child1_name VARCHAR(16),
    child1_order INT,
    child2_name VARCHAR(16),
    child2_order INT,
    child3_name VARCHAR(16),
    child3_order INT
) AUTO_INCREMENT = 1000;

CREATE TABLE employee_training (
    employee_id INT NOT NULL,
    certification_name VARCHAR(16) NOT NULL,
    trainer_name VARCHAR(16) NOT NULL,
    PRIMARY KEY (employee_id, certification_name),
    UNIQUE (employee_id, trainer_name),
    FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
);

INSERT INTO employee (
    employee_id,
    first_name,
    last_name,
    dob,
    title,
    salary,
    child1_name,
    child1_order,
    child2_name,
    child2_order,
    child3_name,
    child3_order
)
VALUES
    (
        1000,
        'Alice',
        'Nguyen',
        '1988-04-12',
        'Analyst',
        65000.00,
        'Evan',
        1,
        'Mia',
        2,
        NULL,
        NULL
    ),
    (
        1001,
        'Brian',
        'Nguyen',
        '1985-09-03',
        'Analyst',
        65000.00,
        'Noah',
        1,
        NULL,
        NULL,
        NULL,
        NULL
    ),
    (
        1002,
        'Carla',
        'Lopez',
        '1990-01-21',
        'Manager',
        90000.00,
        'Sofia',
        1,
        'Lucas',
        2,
        NULL,
        NULL
    ),
    (
        1003,
        'Darius',
        'Patel',
        '1987-07-19',
        'Analyst',
        65000.00,
        'Ava',
        1,
        'Rohan',
        2,
        NULL,
        NULL
    ),
    (
        1004,
        'Elena',
        'Martinez',
        '1992-11-08',
        'Manager',
        90000.00,
        'Mateo',
        1,
        'Camila',
        2,
        'Isla',
        3
    ),
    (
        1005,
        'Farah',
        'Khan',
        '1989-02-14',
        'Analyst',
        65000.00,
        'Zara',
        1,
        'Omar',
        2,
        NULL,
        NULL
    ),
    (
        1006,
        'Gavin',
        'Brooks',
        '1983-05-27',
        'Manager',
        90000.00,
        'Liam',
        1,
        'Chloe',
        2,
        'Nora',
        3
    ),
    (
        1007,
        'Helena',
        'Wright',
        '1991-08-30',
        'Analyst',
        65000.00,
        'Eli',
        1,
        'Grace',
        2,
        NULL,
        NULL
    );

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
