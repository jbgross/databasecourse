drop table if exists artist;
drop table if exists album;
drop table if exists file;
drop table if exists genre;

create table genre
(
genre char(12) primary key
);

insert into genre (genre) values ('Rock');
insert into genre (genre) values ('Pop');
insert into genre (genre) values ('Jazz');
insert into genre (genre) values ('Classical');
insert into genre (genre) values ('Country');
insert into genre (genre) values ('EDM');
insert into genre (genre) values ('Electronica');
insert into genre (genre) values ('Hip Hop');

create table artist
(
artistid integer primary key autoincrement,
name varchar(32) not null,
genre char(12) not null,
foreign key (genre) references genre (genre) on delete cascade
);

insert into artist (artistid, name, genre) values (1, 'Eminem', 'Hip Hop');
insert into artist (artistid, name, genre) values (2, 'Miles Davis', 'Jazz');
insert into artist (artistid, name, genre) values (3, 'Ludwig von Beethoven', 'Classical');
insert into artist (artistid, name, genre) values (4, 'Smashing Pumpkins', 'Rock');
insert into artist (artistid, name, genre) values (5, 'Hank Williams', 'Country');
insert into artist (artistid, name, genre) values (6, 'GusGus', 'Pop');
insert into artist (artistid, name, genre) values (7, 'Ellie Goulding', 'EDM');
insert into artist (artistid, name, genre) values (8, 'Aphex Twin', 'Electronica');
insert into artist (artistid, name, genre) values (9, 'Orbital', 'Electronica');
insert into artist (artistid, name, genre) values (10, 'New Order', 'Rock');
insert into artist (artistid, name, genre) values (11, 'Ella Fitzgerald', 'Jazz');

create table album
(
albumid integer primary key autoincrement,
title varchar(64) not null,
artistid integer not null,
foreign key (artistid) references artist(artistid)
); 

insert into album (albumid, title, artistid) values (901, '8 Mile (Music from and Inspired By the Motion Picture)', 1);
insert into album (albumid, title, artistid) values (902, 'The Marshall Mathers LP', 1);
insert into album (albumid, title, artistid) values (903, 'The Complete Birth of the Cool', 2);
insert into album (albumid, title, artistid) values (904, 'Beethovens Symphony #4', 3);
insert into album (albumid, title, artistid) values (905, 'Pisces Iscariot', 4);
insert into album (albumid, title, artistid) values (906, 'Lonesome Blues', 5);

create table file 
(
fileid integer not null primary key,
trackname varchar(32) not null,
length decimal(6,2) not null,
albumid integer not null,
foreign key (albumid) references album (albumid)
);

insert into file (fileid, trackname, length, albumid) values (1001, 'Lose Yourself', 5.27, 901);
insert into file (fileid, trackname, length, albumid) values (1002, 'The Real Slim Shady', 4.44, 902);
insert into file (fileid, trackname, length, albumid) values (1003, 'Move', 2.34, 903);
insert into file (fileid, trackname, length, albumid) values (1004, 'Jeru', 3.14, 903);
insert into file (fileid, trackname, length, albumid) values (1005, 'Moon Dreams', 3.20, 903);
insert into file (fileid, trackname, length, albumid) values (1006, 'Venus de Milo', 3.12, 903);
insert into file (fileid, trackname, length, albumid) values (1007, 'Budo', 2.36, 903);
insert into file (fileid, trackname, length, albumid) values (1008, 'Deception', 2.49, 903);
insert into file (fileid, trackname, length, albumid) values (1009, 'Godchild', 3.10, 903);
insert into file (fileid, trackname, length, albumid) values (1010, 'Boplicity', 3.02, 903);
insert into file (fileid, trackname, length, albumid) values (1011, 'Rocker', 3.07, 903);
insert into file (fileid, trackname, length, albumid) values (1012, 'Israel', 2.18, 903);
insert into file (fileid, trackname, length, albumid) values (1013, 'Rouge', 3.15, 903);
insert into file (fileid, trackname, length, albumid) values (1014, 'Darn That Dream', 3.25, 903);
insert into file (fileid, trackname, length, albumid) values (1015, 'Birth of the Cool Theme (Live)', 0.18, 903);
insert into file (fileid, trackname, length, albumid) values (1016, 'Symphony Sid Announces the Band (Live)', 1.03, 903);
insert into file (fileid, trackname, length, albumid) values (1017, 'Move (Live)', 3.43, 903);
insert into file (fileid, trackname, length, albumid) values (1018, 'Why Do I Love You (Live)', 3.42, 903);
insert into file (fileid, trackname, length, albumid) values (1019, 'Godchild (Live)', 5.52, 903);
insert into file (fileid, trackname, length, albumid) values (1020, 'Symphony Sid Introduction (Live)', 0.25, 903);
insert into file (fileid, trackname, length, albumid) values (1021, 'S il Vous Plait (Live)', 4.23, 903);
insert into file (fileid, trackname, length, albumid) values (1022, 'Moon Dreams (Live)', 3.08, 903);
insert into file (fileid, trackname, length, albumid) values (1023, 'Budo (Hallucination)', 3.26, 903);
insert into file (fileid, trackname, length, albumid) values (1024, 'Darn That Dream (Live)', 4.24, 903);
insert into file (fileid, trackname, length, albumid) values (1025, 'Move (Live)', 4.49, 903);
insert into file (fileid, trackname, length, albumid) values (1026, 'Moon Dreams (Live)', 3.47, 903);
insert into file (fileid, trackname, length, albumid) values (1027, 'Budo (Hallucinations)', 4.21, 903);
insert into file (fileid, trackname, length, albumid) values (1028, 'Allegro Vivace E Con Brio', 10.03, 904);
insert into file (fileid, trackname, length, albumid) values (1029, 'Allegretto Scherzando', 4.49, 904);
insert into file (fileid, trackname, length, albumid) values (1030, 'Temp Di Menuetto', 5.56, 904);
insert into file (fileid, trackname, length, albumid) values (1031, 'Allegro Vivace', 7.29, 904);
insert into file (fileid, trackname, length, albumid) values (1032, 'Soothe', 2.36, 905);
insert into file (fileid, trackname, length, albumid) values (1033, 'Frail and Bedazzled', 3.17, 905);
insert into file (fileid, trackname, length, albumid) values (1034, 'Plume', 3.38, 905);
insert into file (fileid, trackname, length, albumid) values (1035, 'Whir', 4.10, 905);
insert into file (fileid, trackname, length, albumid) values (1036, 'Blew Away', 3.32, 905);
insert into file (fileid, trackname, length, albumid) values (1037, 'Pissant', 2.31, 905);
insert into file (fileid, trackname, length, albumid) values (1038, 'Hello Kitty Kat', 4.33, 905);
insert into file (fileid, trackname, length, albumid) values (1039, 'Obscured', 5.22, 905);
insert into file (fileid, trackname, length, albumid) values (1040, 'Landslide', 3.11, 905);
insert into file (fileid, trackname, length, albumid) values (1041, 'Starla', 11.01, 905);
insert into file (fileid, trackname, length, albumid) values (1042, 'Blue', 3.20, 905);
insert into file (fileid, trackname, length, albumid) values (1043, 'Girl Named Sandoz', 3.35, 905);
insert into file (fileid, trackname, length, albumid) values (1044, 'La Dolly Vita', 4.17, 905);
insert into file (fileid, trackname, length, albumid) values (1045, 'Spaced', 2.24, 905);
insert into file (fileid, trackname, length, albumid) values (1046, 'Lonesome Blue', 2.30, 906);


