drop table if exists savingsaccount; 
drop table if exists checkingaccount;
drop table if exists owns;
drop table if exists checktable;
drop table if exists accounttransaction;
drop table if exists accounttransactiontype;
drop table if exists account;
drop table if exists accountholder;
drop table if exists accounttype;


create table accounttype
(
accounttype char(12) primary key
);

insert into accounttype (accounttype) values ('Checking');
insert into accounttype (accounttype) values ('Savings');

create table account
(
accountid int unsigned not null primary key,
balance decimal (12,2) not null,
accounttype char(4) not null,
foreign key (accounttype) references accounttype(accounttype) on delete cascade
);

insert into account (accountid, balance, accounttype) values (451267, 150.00, 'Checking');
insert into account (accountid, balance, accounttype) values (631826, 9127.44, 'Checking');
insert into account (accountid, balance, accounttype) values (124127, 847.66, 'Checking');
insert into account (accountid, balance, accounttype) values (938421, 766.00, 'Checking');
insert into account (accountid, balance, accounttype) values (348944, 320.31, 'Checking');
insert into account (accountid, balance, accounttype) values (678193, 7542.00, 'Savings');
insert into account (accountid, balance, accounttype) values (538465, 427.66, 'Savings');
insert into account (accountid, balance, accounttype) values (543654, 4237.36, 'Savings');
insert into account (accountid, balance, accounttype) values (981236, 42212.12, 'Savings');
insert into account (accountid, balance, accounttype) values (724968, 54.55, 'Savings');

create table savingsaccount 
(
accountid int unsigned not null primary key,
interestrate decimal (4,4) not null,
foreign key (accountid) references account(accountid)
);

insert into savingsaccount (accountid, interestrate) values (678193, 0.0095);
insert into savingsaccount (accountid, interestrate) values (538465, 0.0105);
insert into savingsaccount (accountid, interestrate) values (543654, 0.0045);
insert into savingsaccount (accountid, interestrate) values (981236, 0.0045);
insert into savingsaccount (accountid, interestrate) values (724968, 0.0150);

create table checkingaccount
(
accountid int unsigned not null primary key,
freecheckspermonth smallint unsigned not null,
foreign key (accountid) references account(accountid)
);

insert into checkingaccount (accountid, freecheckspermonth) values (451267, 50);
insert into checkingaccount (accountid, freecheckspermonth) values (631826, 30);
insert into checkingaccount (accountid, freecheckspermonth) values (124127, 150);
insert into checkingaccount (accountid, freecheckspermonth) values (938421, 25);
insert into checkingaccount (accountid, freecheckspermonth) values (348944, 50);

create table accountholder
(
accountholderid int unsigned primary key,
accountholdername varchar(64) not null,
accountholderbirthdate date not null 
);

insert into accountholder (accountholderid, accountholdername, accountholderbirthdate) values (46311, 'Sally Hernandez', '1968/04/15');
insert into accountholder (accountholderid, accountholdername, accountholderbirthdate) values (46312, 'Robert Li', '1980/9/1');
insert into accountholder (accountholderid, accountholdername, accountholderbirthdate) values (46313, 'Hugh Wolf', '1975/12/5');
insert into accountholder (accountholderid, accountholdername, accountholderbirthdate) values (46314, 'Alex Smith', '1955/7/12');
insert into accountholder (accountholderid, accountholdername, accountholderbirthdate) values (46315, 'Phillip Gomez', '1985/8/14');
insert into accountholder (accountholderid, accountholdername, accountholderbirthdate) values (46316, 'Amelia Clarke', '1977/3/19');
insert into accountholder (accountholderid, accountholdername, accountholderbirthdate) values (46317, 'Lucy Sutton', '1978/11/11');
insert into accountholder (accountholderid, accountholdername, accountholderbirthdate) values (46318, 'Jin Hao', '1966/6/16');
insert into accountholder (accountholderid, accountholdername, accountholderbirthdate) values (46319, 'Fitzhugh Wallace', '1948/4/12');

create table owns
(
accountid int unsigned not null,
accountholderid int unsigned not null,
primary key (accountid, accountholderid),
foreign key (accountid) references account(accountid),
foreign key (accountholderid) references accountholder(accountholderid)
);

insert into owns (accountid, accountholderid) values (451267, 46311);
insert into owns (accountid, accountholderid) values (631826, 46312);
insert into owns (accountid, accountholderid) values (124127, 46313);
insert into owns (accountid, accountholderid) values (938421, 46314);
insert into owns (accountid, accountholderid) values (348944, 46315);
insert into owns (accountid, accountholderid) values (678193, 46316);
insert into owns (accountid, accountholderid) values (538465, 46317);
insert into owns (accountid, accountholderid) values (543654, 46318);
insert into owns (accountid, accountholderid) values (981236, 46319);
insert into owns (accountid, accountholderid) values (724968, 46319);

create table accounttransactiontype
(
accounttransactiontype varchar(12) not null primary key
);

insert into accounttransactiontype (accounttransactiontype) values ('Open');
insert into accounttransactiontype (accounttransactiontype) values ('Close');
insert into accounttransactiontype (accounttransactiontype) values ('Deposit');
insert into accounttransactiontype (accounttransactiontype) values ('Withdrawal');
insert into accounttransactiontype (accounttransactiontype) values ('Check');

create table accounttransaction
(
accountid int unsigned not null,
accounttransactionid int unsigned,
accounttransactiontype varchar (12) not null,
amount decimal(12,2),
primary key (accountid, accounttransactionid),
foreign key (accountid) references account(accountid),
foreign key (accounttransactiontype) references accounttransactiontype(accounttransactiontype)
);

create table checktable
(
accountid int unsigned not null,
accounttransactionid int unsigned not null,
checknumber int unsigned not null,
checkamount decimal(12, 2) not null,
primary key (accountid, checknumber),
foreign key (accountid) references account(accountid),
foreign key (accountid, accounttransactionid) references accounttransaction(accountid, accounttransactionid)
);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (451267, 1001, 'Open', 50);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (451267, 1002, 'Deposit', 75.32);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (451267, 1003, 'Deposit', 81.98);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (451267, 1004, 'Check', 27.15);
insert into checktable (accountid, accounttransactionid, checknumber, checkamount) values (451267, 1004, 101, 27.15);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (451267, 1005, 'Check', 30.15);
insert into checktable (accountid, accounttransactionid, checknumber, checkamount) values (451267, 1005, 102, 30.15);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (631826, 1001, 'Open', 9015.40);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (631826, 1002, 'Check', 300.37);
insert into checktable (accountid, accounttransactionid, checknumber, checkamount) values (631826, 1002, 101, 300.37);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (631826, 1003, 'Check', 115.49);
insert into checktable (accountid, accounttransactionid, checknumber, checkamount) values (631826, 1003, 102, 115.49);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (631826, 1004, 'Check', 96.18);
insert into checktable (accountid, accounttransactionid, checknumber, checkamount) values (631826, 1004, 103, 96.18);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (631826, 1005, 'Deposit', 625.08);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (124127, 1001, 'Open', 900);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (124127, 1002, 'Deposit', 315.44);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (124127, 1003, 'Check', 204.18);
insert into checktable (accountid, accounttransactionid, checknumber, checkamount) values (124127, 1003, 101, 204.18);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (124127, 1004, 'Deposit', 85);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (124127, 1005, 'Open', 248.60);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (938421, 1001, 'Open', 712.41);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (938421, 1002, 'Check', 148.92);
insert into checktable (accountid, accounttransactionid, checknumber, checkamount) values (938421, 1002, 101, 148.92);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (938421, 1003, 'Check', 16.97);
insert into checktable (accountid, accounttransactionid, checknumber, checkamount) values (938421, 1003, 102, 16.97);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (938421, 1004, 'Check', 16.97);
insert into checktable (accountid, accounttransactionid, checknumber, checkamount) values (938421, 1004, 103, 16.97);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (938421, 1005, 'Deposit', 236.45);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (348944, 1001, 'Open', 304.14);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (348944, 1002, 'Check', 7.61);
insert into checktable (accountid, accounttransactionid, checknumber, checkamount) values (348944, 1002, 101, 7.61);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (348944, 1003, 'Deposit', 61.04);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (348944, 1004, 'Withdrawal', 91.82);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (348944, 1005, 'Deposit', 54.56);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (678193, 1001, 'Open', 7615.55);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (678193, 1002, 'Deposit', 616.43);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (678193, 1003, 'Withdrawal', 780.00);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (678193, 1004, 'Withdrawal', 699.95);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (678193, 1005, 'Deposit', 789.97);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (538465, 1001, 'Open', 1414.14);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (538465, 1002, 'Withdrawal', 967.00);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (538465, 1003, 'Deposit', 215.76);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (538465, 1004, 'Withdrawal', 18.98);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (538465, 1005, 'Withdrawal', 216.26);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (543654, 1001, 'Open', 5147.31);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (543654, 1002, 'Deposit', 180.66);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (543654, 1003, 'Withdrawal', 894.22);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (543654, 1004, 'Withdrawal', 65.18);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (543654, 1005, 'Deposit', 41.06);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (981236, 1001, 'Open', 42212.12);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (981236, 1002, 'Deposit', 79.66);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (981236, 1003, 'Deposit', 202.12);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (981236, 1004, 'Withdrawal', 39.44);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (981236, 1005, 'Withdrawal', 68.61);

insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (724968, 1001, 'Open', 54.55);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (724968, 1002, 'Deposit', 61.64);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (724968, 1003, 'Withdrawal', 86.43);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (724968, 1004, 'Deposit', 271.44);
insert into accounttransaction (accountid, accounttransactionid, accounttransactiontype, amount) values (724968, 1005, 'Deposit', 816.50);
