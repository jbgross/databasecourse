use mp3;
drop table if exists artist;
drop table if exists album;
drop table if exists mp3;
drop table if exists performs;

drop database if exists mp3;

create database mp3;

use bank;

create table genres
(
genre char(12) primary key
);

insert into genres (genre) values ('Rock');
insert into genres (genre) values ('Pop');
insert into genres (genre) values ('Jazz');
insert into genres (genre) values ('Classical');
insert into genres (genre) values ('Country');
insert into genres (genre) values ('EDM');
insert into genres (genre) values ('Electronica');
insert into genres (genre) values ('Hip Hop');

create table artist
(
artist_name varchar(32) not null,
genre char(12) not null,
foreign key (genre) references genres (genre) on delete cascade
);

insert into artist (artist_name, genre) values ('Eminem', 'Hip Hop');
insert into artist (artist_name, genre) values ('Miles Davis', 'Jazz');
insert into artist (artist_name, genre) values ('Ludwig von Beethoven', 'Classical');
insert into artist (artist_name, genre) values ('Smashing Pumpkins', 'Rock');
insert into artist (artist_name, genre) values ('Hank Williams', 'Country');
insert into artist (artist_name, genre) values ('GusGus', 'Pop');
insert into artist (artist_name, genre) values ('Ellie Goulding', 'EDM');
insert into artist (artist_name, genre) values ('Aphex Twin', 'Electronica');
insert into artist (artist_name, genre) values ('Orbital', 'Electronica');
insert into artist (artist_name, genre) values ('New Order', 'Rock');
insert into artist (artist_name, genre) values ('Ella Fitzgerald', 'Jazz');

create table album
(
album_name varchar(64) not null,
artist_name varchar(32) not null,
primary key (album_name, artist_name),
foreign key (artist_name) references artist(artist_name)
); 

insert into album (album_name, artist_name) values ('8 Mile (Music from and Inspired By the Motion Picture)', 'Eminem');
insert into album (album_name, artist_name) values ('The Marshall Mathers LP', 'Eminem');
insert into album (album_name, artist_name) values ('The Complete Birth of the Cool', 'Miles Davis');
insert into album (album_name, artist_name) values ('Beethoven\'s Symphony #4', 'Ludwig von Beethoven');
insert into album (album_name, artist_name) values ('Pisces Iscariot', 'Smashing Pumpkins');
insert into album (album_name, artist_name) values ('Lonesome Blues', 'Hank Williams');

create table mp3 
(
mp3_id int unsigned not null primary key,
title varchar(32) not null,
length decimal(6,2) not null,
album_title varchar(64) not null,
foreign key (album_title) references album (album_title)
);

insert into mp3 (mp3_id, title, length, album_title) values (1001, 'Lose Yourself', 5.27, '8 Mile (Music from and Inspired By the Motion Picture)');
insert into mp3 (mp3_id, title, length, album_title) values (1002, 'The Real Slim Shady', 4.44, 'The Marshall Mathers LP');
insert into mp3 (mp3_id, title, length, album_title) values (1003, 'Move', 2.34, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1004, 'Jeru', 3.14, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1005, 'Moon Dreams', 3.20, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1006, 'Venus de Milo', 3.12, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1007, 'Budo', 2.36, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1008, 'Deception', 2.49, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1009, 'Godchild', 3.10, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1010, 'Boplicity', 3.02, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1011, 'Rocker', 3.07, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1012, 'Israel', 2.18, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1013, 'Rouge', 3.15, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1014, 'Darn That Dream', 3.25, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1015, 'Birth of the Cool Theme (Live)', 0.18, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1016, 'Symphony Sid Announces the Band (Live)', 1.03, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1017, 'Move (Live)', 3.43, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1018, 'Why Do I Love You (Live)', 3.42, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1019, 'Godchild (Live)', 5.52, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1020, 'Symphony Sid Introduction (Live)', 0.25, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1021, 'S''il Vous Plait (Live)', 4.23, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1022, 'Moon Dreams (Live)', 3.08, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1023, 'Budo (Hallucination)', 3.26, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1024, 'Darn That Dream (Live)', 4.24, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1025, 'Move (Live)', 4.49, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1026, 'Moon Dreams (Live)', 3.47, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1027, 'Budo (Hallucinations)', 4.21, 'The Complete Birth of the Cool');
insert into mp3 (mp3_id, title, length, album_title) values (1028, 'Allegro Vivace E Con Brio', 10.03, 'Beethoven''s Symphony #4');
insert into mp3 (mp3_id, title, length, album_title) values (1029, 'Allegretto Scherzando', 4.49, 'Beethoven''s Symphony #4');
insert into mp3 (mp3_id, title, length, album_title) values (1030, 'Temp Di Menuetto', 5.56, 'Beethoven''s Symphony #4');
insert into mp3 (mp3_id, title, length, album_title) values (1031, 'Allegro Vivace', 7.29, 'Beethoven''s Symphony #4');
insert into mp3 (mp3_id, title, length, album_title) values (1032, 'Soothe', 2.36, 'Pisces Iscariot');
insert into mp3 (mp3_id, title, length, album_title) values (1033, 'Frail and Bedazzled', 3.17, 'Pisces Iscariot');
insert into mp3 (mp3_id, title, length, album_title) values (1034, 'Plume', 3.38, 'Pisces Iscariot');
insert into mp3 (mp3_id, title, length, album_title) values (1035, 'Whir', 4.10, 'Pisces Iscariot');
insert into mp3 (mp3_id, title, length, album_title) values (1036, 'Blew Away', 3.32, 'Pisces Iscariot');
insert into mp3 (mp3_id, title, length, album_title) values (1037, 'Pissant', 2.31, 'Pisces Iscariot');
insert into mp3 (mp3_id, title, length, album_title) values (1038, 'Hello Kitty Kat', 4.33, 'Pisces Iscariot');
insert into mp3 (mp3_id, title, length, album_title) values (1039, 'Obscured', 5.22, 'Pisces Iscariot');
insert into mp3 (mp3_id, title, length, album_title) values (1040, 'Landslide', 3.11, 'Pisces Iscariot');
insert into mp3 (mp3_id, title, length, album_title) values (1041, 'Starla', 11.01, 'Pisces Iscariot');
insert into mp3 (mp3_id, title, length, album_title) values (1042, 'Blue', 3.20, 'Pisces Iscariot');
insert into mp3 (mp3_id, title, length, album_title) values (1043, 'Girl Named Sandoz', 3.35, 'Pisces Iscariot');
insert into mp3 (mp3_id, title, length, album_title) values (1044, 'La Dolly Vita', 4.17, 'Pisces Iscariot');
insert into mp3 (mp3_id, title, length, album_title) values (1045, 'Spaced', 2.24, 'Pisces Iscariot');
insert into mp3 (mp3_id, title, length, album_title) values (1046, 'Lonesome Blue', 2.30, 'Lonesome Blue');


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
