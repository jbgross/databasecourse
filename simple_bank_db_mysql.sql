DROP DATABASE IF EXISTS simple_bank;
CREATE DATABASE IF NOT EXISTS simple_bank;
USE simple_bank;

CREATE TABLE account_holder
(
holder_id INT UNSIGNED PRIMARY KEY,
holder_name VARCHAR(64) NOT NULL,
birthdate DATE NOT NULL
);

INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46311, 'Sally Hernandez', '1968-04-15');
INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46312, 'Robert Li', '1980-9-1');
INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46313, 'Hugh Wolf', '1975-12-5');
INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46314, 'Alex Smith', '1955-7-12');
INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46315, 'Phillip Gomez', '1985-8-14');
INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46316, 'Amelia Clarke', '1977-3-19');
INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46317, 'Lucy Sutton', '1978-11-11');
INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46318, 'Jin Hao', '1966-6-16');
INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46319, 'Fitzhugh Wallace', '1948-4-12');

CREATE TABLE account_type 
(
account_type CHAR(16) PRIMARY KEY
);

INSERT INTO account_type (account_type) VALUES ('Checking');
INSERT INTO account_type (account_type) VALUES ('Savings');

CREATE TABLE bank_account
(
account_id INT UNSIGNED NOT NULL PRIMARY KEY auto_increment,
holder_id INT UNSIGNED NOT NULL,
balance DECIMAL (16,2) NOT NULL,
account_type CHAR(16) NOT NULL,
interest_rate DECIMAL (4,4) NULL,
FOREIGN KEY (account_type) REFERENCES account_type(account_type) ON DELETE CASCADE,
FOREIGN KEY (holder_id) REFERENCES account_holder(holder_id) ON DELETE CASCADE
);

INSERT INTO bank_account (account_id, holder_id, balance, account_type) VALUES (451267, 46312, 150.00, 'Checking');
INSERT INTO bank_account (account_id, holder_id, balance, account_type) VALUES (631826, 46313, 9127.44, 'Checking');
INSERT INTO bank_account (account_id, holder_id, balance, account_type) VALUES (124127, 46314, 847.66, 'Checking');
INSERT INTO bank_account (account_id, holder_id, balance, account_type) VALUES (938421, 46315, 766.00, 'Checking');
INSERT INTO bank_account (account_id, holder_id, balance, account_type) VALUES (348944, 46316, 320.31, 'Checking');
INSERT INTO bank_account (account_id, holder_id, balance, account_type) VALUES (678193, 46317, 7542.00, 'Savings');
INSERT INTO bank_account (account_id, holder_id, balance, account_type) VALUES (538465, 46318, 427.66, 'Savings');
INSERT INTO bank_account (account_id, holder_id, balance, account_type) VALUES (543654, 46319, 4237.36, 'Savings');
INSERT INTO bank_account (account_id, holder_id, balance, account_type) VALUES (981236, 46312, 42212.12, 'Savings');
INSERT INTO bank_account (account_id, holder_id, balance, account_type) VALUES (724968, 46313, 54.55, 'Savings');

CREATE TABLE transaction_type
(
transaction_type VARCHAR(16) NOT NULL PRIMARY KEY
);

INSERT INTO transaction_type (transaction_type) VALUES ('Open');
INSERT INTO transaction_type (transaction_type) VALUES ('Close');
INSERT INTO transaction_type (transaction_type) VALUES ('Deposit');
INSERT INTO transaction_type (transaction_type) VALUES ('Withdrawal');
INSERT INTO transaction_type (transaction_type) VALUES ('Check');

CREATE TABLE bank_transaction
(
account_id INT UNSIGNED NOT NULL,
transaction_id INT UNSIGNED,
transaction_type VARCHAR (16) NOT NULL,
amount DECIMAL(16,2),
PRIMARY KEY (account_id, transaction_id),
FOREIGN KEY (account_id) REFERENCES bank_account(account_id),
FOREIGN KEY (transaction_type) REFERENCES transaction_type(transaction_type)
);


INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (451267, 1001, 'Open', 50);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (451267, 1002, 'Deposit', 75.32);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (451267, 1003, 'Deposit', 81.98);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (451267, 1004, 'Check', 27.15);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (451267, 1005, 'Check', 30.15);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (631826, 1001, 'Open', 9015.40);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (631826, 1002, 'Check', 300.37);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (631826, 1003, 'Check', 115.49);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (631826, 1004, 'Check', 96.18);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (631826, 1005, 'Deposit', 625.08);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (124127, 1001, 'Open', 900);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (124127, 1002, 'Deposit', 315.44);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (124127, 1003, 'Check', 204.18);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (124127, 1004, 'Deposit', 85);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (124127, 1005, 'Open', 248.60);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (938421, 1001, 'Open', 712.41);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (938421, 1002, 'Check', 148.92);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (938421, 1003, 'Check', 16.97);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (938421, 1004, 'Check', 16.97);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (938421, 1005, 'Deposit', 236.45);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (348944, 1001, 'Open', 304.14);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (348944, 1002, 'Check', 7.61);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (348944, 1003, 'Deposit', 61.04);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (348944, 1004, 'Withdrawal', 91.82);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (348944, 1005, 'Deposit', 54.56);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (678193, 1001, 'Open', 7615.55);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (678193, 1002, 'Deposit', 616.43);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (678193, 1003, 'Withdrawal', 780.00);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (678193, 1004, 'Withdrawal', 699.95);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (678193, 1005, 'Deposit', 789.97);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (538465, 1001, 'Open', 1414.14);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (538465, 1002, 'Withdrawal', 967.00);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (538465, 1003, 'Deposit', 215.76);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (538465, 1004, 'Withdrawal', 18.98);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (538465, 1005, 'Withdrawal', 216.26);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (543654, 1001, 'Open', 5147.31);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (543654, 1002, 'Deposit', 180.66);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (543654, 1003, 'Withdrawal', 894.22);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (543654, 1004, 'Withdrawal', 65.18);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (543654, 1005, 'Deposit', 41.06);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (981236, 1001, 'Open', 42212.12);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (981236, 1002, 'Deposit', 79.66);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (981236, 1003, 'Deposit', 202.12);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (981236, 1004, 'Withdrawal', 39.44);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (981236, 1005, 'Withdrawal', 68.61);

INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (724968, 1001, 'Open', 54.55);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (724968, 1002, 'Deposit', 61.64);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (724968, 1003, 'Withdrawal', 86.43);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (724968, 1004, 'Deposit', 271.44);
INSERT INTO bank_transaction (account_id, transaction_id, transaction_type, amount) VALUES (724968, 1005, 'Deposit', 816.50);
