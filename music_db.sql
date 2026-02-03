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
