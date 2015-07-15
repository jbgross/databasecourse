use bank;
drop table if exists savings_account; 
drop table if exists checking_account;
drop table if exists owns;
drop table if exists checktable;
drop table if exists transaction;
drop table if exists account;
drop table if exists account_holder;

drop database if exists bank;

create database bank;

use bank;

create table account_types 
(
account_type char(12) primary key
);

insert into account_types (account_type) values ('Checking');
insert into account_types (account_type) values ('Savings');

create table account
(
account_id int unsigned not null primary key auto_increment,
balance decimal (12,2) not null,
account_type char(4) not null,
foreign key (account_type) references account_types(account_type) on delete cascade
);

insert into account (account_id, balance, account_type) values (451267, 150.00, 'Checking');
insert into account (account_id, balance, account_type) values (631826, 9127.44, 'Checking');
insert into account (account_id, balance, account_type) values (124127, 847.66, 'Checking');
insert into account (account_id, balance, account_type) values (938421, 766.00, 'Checking');
insert into account (account_id, balance, account_type) values (348944, 320.31, 'Checking');
insert into account (account_id, balance, account_type) values (678193, 7542.00, 'Savings');
insert into account (account_id, balance, account_type) values (538465, 427.66, 'Savings');
insert into account (account_id, balance, account_type) values (543654, 4237.36, 'Savings');
insert into account (account_id, balance, account_type) values (981236, 42212.12, 'Savings');
insert into account (account_id, balance, account_type) values (724968, 54.55, 'Savings');

create table savings_account 
(
account_id int unsigned not null primary key,
interest_rate decimal (4,4) not null,
foreign key (account_id) references account(account_id)
);

insert into savings_account (account_id, interest_rate) values (678193, 0.0095);
insert into savings_account (account_id, interest_rate) values (538465, 0.0105);
insert into savings_account (account_id, interest_rate) values (543654, 0.0045);
insert into savings_account (account_id, interest_rate) values (981236, 0.0045);
insert into savings_account (account_id, interest_rate) values (724968, 0.0150);

create table checking_account
(
account_id int unsigned not null primary key,
free_checks_per_month smallint unsigned not null,
foreign key (account_id) references account(account_id)
);

insert into checking_account (account_id, free_checks_per_month) values (451267, 50);
insert into checking_account (account_id, free_checks_per_month) values (631826, 30);
insert into checking_account (account_id, free_checks_per_month) values (124127, 150);
insert into checking_account (account_id, free_checks_per_month) values (938421, 25);
insert into checking_account (account_id, free_checks_per_month) values (348944, 50);

create table account_holder
(
account_holder_id int unsigned primary key,
account_holder_name varchar(64) not null,
account_holder_birthdate date not null 
);

insert into account_holder (account_holder_id, account_holder_name, account_holder_birthdate) values (46311, 'Sally Hernandez', '1968/04/15');
insert into account_holder (account_holder_id, account_holder_name, account_holder_birthdate) values (46312, 'Robert Li', '1980/9/1');
insert into account_holder (account_holder_id, account_holder_name, account_holder_birthdate) values (46313, 'Hugh Wolf', '1975/12/5');
insert into account_holder (account_holder_id, account_holder_name, account_holder_birthdate) values (46314, 'Alex Smith', '1955/7/12');
insert into account_holder (account_holder_id, account_holder_name, account_holder_birthdate) values (46315, 'Phillip Gomez', '1985/8/14');
insert into account_holder (account_holder_id, account_holder_name, account_holder_birthdate) values (46316, 'Amelia Clarke', '1977/3/19');
insert into account_holder (account_holder_id, account_holder_name, account_holder_birthdate) values (46317, 'Lucy Sutton', '1978/11/11');
insert into account_holder (account_holder_id, account_holder_name, account_holder_birthdate) values (46318, 'Jin Hao', '1966/6/16');
insert into account_holder (account_holder_id, account_holder_name, account_holder_birthdate) values (46319, 'Fitzhugh Wallace', '1948/4/12');

create table owns
(
account_id int unsigned not null,
account_holder_id int unsigned not null,
primary key (account_id, account_holder_id),
foreign key (account_id) references account(account_id),
foreign key (account_holder_id) references account_holder(account_holder_id)
);

insert into owns (account_id, account_holder_id) values (451267, 46311);
insert into owns (account_id, account_holder_id) values (631826, 46312);
insert into owns (account_id, account_holder_id) values (124127, 46313);
insert into owns (account_id, account_holder_id) values (938421, 46314);
insert into owns (account_id, account_holder_id) values (348944, 46315);
insert into owns (account_id, account_holder_id) values (678193, 46316);
insert into owns (account_id, account_holder_id) values (538465, 46317);
insert into owns (account_id, account_holder_id) values (543654, 46318);
insert into owns (account_id, account_holder_id) values (981236, 46319);
insert into owns (account_id, account_holder_id) values (724968, 46319);

create table transaction_types
(
transaction_type varchar(12) not null primary key
);

insert into transaction_types (transaction_type) values ('Open');
insert into transaction_types (transaction_type) values ('Close');
insert into transaction_types (transaction_type) values ('Deposit');
insert into transaction_types (transaction_type) values ('Withdrawal');
insert into transaction_types (transaction_type) values ('Check');

create table transaction
(
account_id int unsigned not null,
transaction_id int unsigned,
transaction_type varchar (12) not null,
amount decimal(12,2),
primary key (account_id, transaction_id),
foreign key (account_id) references account(account_id),
foreign key (transaction_type) references transaction_types(transaction_type)
);

create table checktable
(
account_id int unsigned not null,
transaction_id int unsigned not null,
check_number int unsigned not null,
check_amount decimal(12, 2) not null,
primary key (account_id, check_number),
foreign key (account_id) references account(account_id),
foreign key (account_id, transaction_id) references transaction(account_id, transaction_id)
);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (451267, 1001, 'Open', 50);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (451267, 1002, 'Deposit', 75.32);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (451267, 1003, 'Deposit', 81.98);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (451267, 1004, 'Check', 27.15);
insert into checktable (account_id, transaction_id, check_number, check_amount) values (451267, 1004, 101, 27.15);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (451267, 1005, 'Check', 30.15);
insert into checktable (account_id, transaction_id, check_number, check_amount) values (451267, 1005, 102, 30.15);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (631826, 1001, 'Open', 9015.40);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (631826, 1002, 'Check', 300.37);
insert into checktable (account_id, transaction_id, check_number, check_amount) values (631826, 1002, 101, 300.37);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (631826, 1003, 'Check', 115.49);
insert into checktable (account_id, transaction_id, check_number, check_amount) values (631826, 1003, 102, 115.49);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (631826, 1004, 'Check', 96.18);
insert into checktable (account_id, transaction_id, check_number, check_amount) values (631826, 1004, 103, 96.18);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (631826, 1005, 'Deposit', 625.08);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (124127, 1001, 'Open', 900);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (124127, 1002, 'Deposit', 315.44);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (124127, 1003, 'Check', 204.18);
insert into checktable (account_id, transaction_id, check_number, check_amount) values (124127, 1003, 101, 204.18);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (124127, 1004, 'Deposit', 85);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (124127, 1005, 'Open', 248.60);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (938421, 1001, 'Open', 712.41);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (938421, 1002, 'Check', 148.92);
insert into checktable (account_id, transaction_id, check_number, check_amount) values (938421, 1002, 101, 148.92);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (938421, 1003, 'Check', 16.97);
insert into checktable (account_id, transaction_id, check_number, check_amount) values (938421, 1003, 102, 16.97);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (938421, 1004, 'Check', 16.97);
insert into checktable (account_id, transaction_id, check_number, check_amount) values (938421, 1004, 103, 16.97);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (938421, 1005, 'Deposit', 236.45);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (348944, 1001, 'Open', 304.14);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (348944, 1002, 'Check', 7.61);
insert into checktable (account_id, transaction_id, check_number, check_amount) values (348944, 1002, 101, 7.61);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (348944, 1003, 'Deposit', 61.04);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (348944, 1004, 'Withdrawal', 91.82);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (348944, 1005, 'Deposit', 54.56);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (678193, 1001, 'Open', 7615.55);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (678193, 1002, 'Deposit', 616.43);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (678193, 1003, 'Withdrawal', 780.00);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (678193, 1004, 'Withdrawal', 699.95);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (678193, 1005, 'Deposit', 789.97);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (538465, 1001, 'Open', 1414.14);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (538465, 1002, 'Withdrawal', 967.00);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (538465, 1003, 'Deposit', 215.76);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (538465, 1004, 'Withdrawal', 18.98);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (538465, 1005, 'Withdrawal', 216.26);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (543654, 1001, 'Open', 5147.31);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (543654, 1002, 'Deposit', 180.66);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (543654, 1003, 'Withdrawal', 894.22);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (543654, 1004, 'Withdrawal', 65.18);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (543654, 1005, 'Deposit', 41.06);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (981236, 1001, 'Open', 42212.12);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (981236, 1002, 'Deposit', 79.66);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (981236, 1003, 'Deposit', 202.12);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (981236, 1004, 'Withdrawal', 39.44);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (981236, 1005, 'Withdrawal', 68.61);

insert into transaction (account_id, transaction_id, transaction_type, amount) values (724968, 1001, 'Open', 54.55);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (724968, 1002, 'Deposit', 61.64);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (724968, 1003, 'Withdrawal', 86.43);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (724968, 1004, 'Deposit', 271.44);
insert into transaction (account_id, transaction_id, transaction_type, amount) values (724968, 1005, 'Deposit', 816.50);
