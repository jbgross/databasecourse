DROP DATABASE IF EXISTS simple_bank;
CREATE DATABASE IF NOT EXISTS simple_bank;
USE simple_bank;

CREATE TABLE account_holder
(
holder_id INT UNSIGNED PRIMARY KEY,
holder_name VARCHAR(64) NOT NULL,
birthdate DATE NOT NULL
);

INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46311, 'Sally Hernandez', '1998-04-15');
INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46312, 'Robert Li', '2005-9-1');
INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46313, 'Hugh Wolf', '1975-12-5');
INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46314, 'Alex Smith', '1985-7-12');
INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46315, 'Phillip Gomez', '1985-8-14');
INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46316, 'Amelia Clarke', '1977-3-19');
INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46317, 'Lucy Sutton', '1978-11-11');
INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46318, 'Jin Hao', '1996-6-16');
INSERT INTO account_holder (holder_id, holder_name, birthdate) VALUES (46319, 'Fitzhugh Wallace', '1968-4-12');

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

INSERT INTO bank_account (account_id, holder_id, balance, account_type, interest_rate) VALUES (451267, 46312, 150.00, 'Checking', NULL);
INSERT INTO bank_account (account_id, holder_id, balance, account_type, interest_rate) VALUES (631826, 46313, 9127.44, 'Checking', NULL);
INSERT INTO bank_account (account_id, holder_id, balance, account_type, interest_rate) VALUES (124127, 46314, 847.66, 'Checking', 0);
INSERT INTO bank_account (account_id, holder_id, balance, account_type, interest_rate) VALUES (938421, 46315, 766.00, 'Checking', 0);
INSERT INTO bank_account (account_id, holder_id, balance, account_type, interest_rate) VALUES (348944, 46316, 320.31, 'Checking', 0);
INSERT INTO bank_account (account_id, holder_id, balance, account_type, interest_rate) VALUES (678193, 46317, 7542.00, 'Savings', 0);
INSERT INTO bank_account (account_id, holder_id, balance, account_type, interest_rate) VALUES (538465, 46318, 427.66, 'Savings', 0.01);
INSERT INTO bank_account (account_id, holder_id, balance, account_type, interest_rate) VALUES (543654, 46319, 4237.36, 'Savings', 0.02);
INSERT INTO bank_account (account_id, holder_id, balance, account_type, interest_rate) VALUES (981236, 46312, 42212.12, 'Savings', 0.03);
INSERT INTO bank_account (account_id, holder_id, balance, account_type, interest_rate) VALUES (724968, 46313, 54.55, 'Savings', 0);

CREATE TABLE transaction_type
(
transaction_type VARCHAR(16) NOT NULL PRIMARY KEY
);

INSERT INTO transaction_type (transaction_type) VALUES ('open');
INSERT INTO transaction_type (transaction_type) VALUES ('close');
INSERT INTO transaction_type (transaction_type) VALUES ('deposit');
INSERT INTO transaction_type (transaction_type) VALUES ('withdrawal');
INSERT INTO transaction_type (transaction_type) VALUES ('check');
INSERT INTO transaction_type (transaction_type) VALUES ('interest');

CREATE TABLE account_transaction
(
account_id INT UNSIGNED NOT NULL,
transaction_id INT UNSIGNED,
transaction_type VARCHAR (16) NOT NULL,
amount DECIMAL(16,2),
transaction_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (account_id, transaction_id),
FOREIGN KEY (account_id) REFERENCES bank_account(account_id),
FOREIGN KEY (transaction_type) REFERENCES transaction_type(transaction_type)
);


INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (451267, 1001, 'open', 50, '2024-01-15 09:23:11');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (451267, 1002, 'deposit', 75.32, '2024-02-03 14:47:56');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (451267, 1003, 'deposit', 81.98, '2024-03-21 10:12:08');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (451267, 1004, 'check', 27.15, '2024-04-02 16:35:44');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (451267, 1005, 'check', 30.15, '2024-05-19 11:08:29');

INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (631826, 1001, 'open', 9015.40, '2024-01-07 09:01:55');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (631826, 1002, 'check', 300.37, '2024-02-14 15:26:10');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (631826, 1003, 'check', 115.49, '2024-03-11 13:44:02');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (631826, 1004, 'check', 96.18, '2024-04-28 10:59:18');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (631826, 1005, 'deposit', 625.08, '2024-06-03 16:21:40');

INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (124127, 1001, 'open', 900, '2024-01-20 08:14:33');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (124127, 1002, 'deposit', 315.44, '2024-02-18 12:37:19');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (124127, 1003, 'check', 204.18, '2024-03-25 17:52:07');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (124127, 1004, 'deposit', 85, '2024-05-09 09:46:58');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (124127, 1005, 'open', 248.60, '2024-06-22 14:18:05');

INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (938421, 1001, 'open', 712.41, '2024-01-05 10:05:49');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (938421, 1002, 'check', 148.92, '2024-02-27 16:33:21');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (938421, 1003, 'check', 16.97, '2024-03-14 11:11:11');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (938421, 1004, 'check', 16.97, '2024-04-30 15:09:47');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (938421, 1005, 'deposit', 236.45, '2024-06-11 13:58:36');

INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (348944, 1001, 'open', 304.14, '2024-01-09 09:55:04');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (348944, 1002, 'check', 7.61, '2024-02-04 10:41:22');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (348944, 1003, 'deposit', 61.04, '2024-03-18 14:19:51');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (348944, 1004, 'withdrawal', 91.82, '2024-04-26 16:06:33');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (348944, 1005, 'deposit', 54.56, '2024-06-08 11:27:45');

INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (678193, 1001, 'open', 7615.55, '2025-01-03 09:00:01');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (678193, 1002, 'deposit', 616.43, '2025-02-15 14:15:19');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (678193, 1003, 'withdrawal', 780.00, '2025-03-10 10:44:08');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (678193, 1004, 'withdrawal', 699.95, '2025-04-21 16:32:57');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (678193, 1005, 'deposit', 789.97, '2025-06-02 13:20:40');

INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (538465, 1001, 'open', 1414.14, '2025-01-08 09:35:12');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (538465, 1002, 'withdrawal', 967.00, '2025-02-19 15:49:26');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (538465, 1003, 'deposit', 215.76, '2025-03-27 11:03:54');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (538465, 1004, 'withdrawal', 18.98, '2025-04-09 10:28:41');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (538465, 1005, 'withdrawal', 216.26, '2025-06-17 16:55:09');

INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (543654, 1001, 'open', 5147.31, '2025-01-14 08:42:00');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (543654, 1002, 'deposit', 180.66, '2025-02-06 12:16:38');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (543654, 1003, 'withdrawal', 894.22, '2025-03-22 17:05:27');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (543654, 1004, 'withdrawal', 65.18, '2025-04-30 14:49:52');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (543654, 1005, 'deposit', 41.06, '2025-06-25 09:31:16');

INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (981236, 1001, 'open', 42212.12, '2025-01-02 09:09:09');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (981236, 1002, 'deposit', 79.66, '2025-02-13 13:57:44');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (981236, 1003, 'deposit', 202.12, '2025-03-05 10:22:18');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (981236, 1004, 'withdrawal', 39.44, '2025-04-18 15:11:53');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (981236, 1005, 'withdrawal', 68.61, '2025-06-29 16:40:07');

INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (724968, 1001, 'open', 54.55, '2025-01-11 08:55:31');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (724968, 1002, 'deposit', 61.64, '2025-02-24 14:07:58');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (724968, 1003, 'withdrawal', 86.43, '2025-03-16 11:39:46');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (724968, 1004, 'deposit', 271.44, '2025-04-27 16:18:03');
INSERT INTO account_transaction (account_id, transaction_id, transaction_type, amount, transaction_time) VALUES (724968, 1005, 'deposit', 816.50, '2025-06-07 13:26:54');
