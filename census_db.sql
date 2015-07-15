use census;
drop table if exists resident;
drop table if exists workclass_type; 
drop table if exists education_type;
drop table if exists marital_status_type;
drop table if exists occupation_type;
drop table if exists relationship_type;
drop table if exists race_type;
drop table if exists country_type;

drop database if exists census;

create database census;

use census;

create table workclass_type
(
workclass_id char(1) not null primary key,
workclass_name varchar(64) not null unique
);

insert into workclass_type (workclass_id, workclass_name) values ('P', 'Private');
insert into workclass_type (workclass_id, workclass_name) values ('S', 'Self-emp-not-inc');
insert into workclass_type (workclass_id, workclass_name) values ('I', 'Self-emp-inc');
insert into workclass_type (workclass_id, workclass_name) values ('F', 'Federal-gov');
insert into workclass_type (workclass_id, workclass_name) values ('L', 'Local-gov');
insert into workclass_type (workclass_id, workclass_name) values ('T', 'State-gov');
insert into workclass_type (workclass_id, workclass_name) values ('W', 'Without-pay');
insert into workclass_type (workclass_id, workclass_name) values ('N', 'Never-worked');
insert into workclass_type (workclass_id, workclass_name) values ('?', 'Unknown(?)');

create table education_type
(
education_id char(1) not null primary key,
education_name varchar(64) not null unique
);

insert into education_type (education_id, education_name) values ('B', 'Bachelors');
insert into education_type (education_id, education_name) values ('S', 'Some-college');
insert into education_type (education_id, education_name) values ('1', '11th');
insert into education_type (education_id, education_name) values ('H', 'HS-grad');
insert into education_type (education_id, education_name) values ('P', 'Prof-school');
insert into education_type (education_id, education_name) values ('A', 'Assoc-acdm');
insert into education_type (education_id, education_name) values ('V', 'Assoc-voc');
insert into education_type (education_id, education_name) values ('9', '9th');
insert into education_type (education_id, education_name) values ('7', '7th-8th');
insert into education_type (education_id, education_name) values ('2', '12th');
insert into education_type (education_id, education_name) values ('M', 'Masters');
insert into education_type (education_id, education_name) values ('4', '1st-4th');
insert into education_type (education_id, education_name) values ('0', '10th');
insert into education_type (education_id, education_name) values ('D', 'Doctorate');
insert into education_type (education_id, education_name) values ('5', '5th-6th');
insert into education_type (education_id, education_name) values ('R', 'Preschool');

create table marital_status_type
(
marital_status_id char(1) not null primary key,
marital_status_name varchar(64) not null unique
);

insert into marital_status_type (marital_status_id, marital_status_name) values ('M', 'Married-civ-spouse');
insert into marital_status_type (marital_status_id, marital_status_name) values ('D', 'Divorced');
insert into marital_status_type (marital_status_id, marital_status_name) values ('N', 'Never-married');
insert into marital_status_type (marital_status_id, marital_status_name) values ('S', 'Separated');
insert into marital_status_type (marital_status_id, marital_status_name) values ('W', 'Widowed');
insert into marital_status_type (marital_status_id, marital_status_name) values ('A', 'Married-spouse-absent');
insert into marital_status_type (marital_status_id, marital_status_name) values ('F', 'Married-AF-spouse');

create table occupation_type
(
occupation_id char(1) not null primary key,
occupation_name varchar(64) not null unique
);

insert into occupation_type (occupation_id, occupation_name) values ('T', 'Tech-support');
insert into occupation_type (occupation_id, occupation_name) values ('C', 'Craft-repair');
insert into occupation_type (occupation_id, occupation_name) values ('O', 'Other-service');
insert into occupation_type (occupation_id, occupation_name) values ('L', 'Sales');
insert into occupation_type (occupation_id, occupation_name) values ('E', 'Exec-managerial');
insert into occupation_type (occupation_id, occupation_name) values ('P', 'Prof-specialty');
insert into occupation_type (occupation_id, occupation_name) values ('H', 'Handlers-cleaners');
insert into occupation_type (occupation_id, occupation_name) values ('M', 'Machine-op-inspct');
insert into occupation_type (occupation_id, occupation_name) values ('A', 'Adm-clerical');
insert into occupation_type (occupation_id, occupation_name) values ('F', 'Farming-fishing');
insert into occupation_type (occupation_id, occupation_name) values ('N', 'Transport-moving');
insert into occupation_type (occupation_id, occupation_name) values ('S', 'Priv-house-serv');
insert into occupation_type (occupation_id, occupation_name) values ('R', 'Protective-serv');
insert into occupation_type (occupation_id, occupation_name) values ('D', 'Armed-Forces');
insert into occupation_type (occupation_id, occupation_name) values ('?', 'Unknown(?)');

create table relationship_type
(
relationship_id char(1) not null primary key,
relationship_name varchar(64) not null unique
);

insert into relationship_type (relationship_id, relationship_name) values ('W', 'Wife');
insert into relationship_type (relationship_id, relationship_name) values ('O', 'Own-child');
insert into relationship_type (relationship_id, relationship_name) values ('H', 'Husband');
insert into relationship_type (relationship_id, relationship_name) values ('N', 'Not-in-family');
insert into relationship_type (relationship_id, relationship_name) values ('R', 'Other-relative');
insert into relationship_type (relationship_id, relationship_name) values ('U', 'Unmarried');

create table race_type
(
race_id char(1) not null primary key,
race_name varchar(64) not null unique
);

insert into race_type (race_id, race_name) values ('W', 'White');
insert into race_type (race_id, race_name) values ('A', 'Asian-Pac-Islander');
insert into race_type (race_id, race_name) values ('I', 'Amer-Indian-Eskimo');
insert into race_type (race_id, race_name) values ('O', 'Other');
insert into race_type (race_id, race_name) values ('B', 'Black');

create table native_country_type
(
native_country_id char(3) not null primary key,
native_country_name varchar(64) not null unique
);

insert into native_country_type (native_country_id, native_country_name) values ('USA', 'United-States');
insert into native_country_type (native_country_id, native_country_name) values ('CAM', 'Cambodia');
insert into native_country_type (native_country_id, native_country_name) values ('ENG', 'England');
insert into native_country_type (native_country_id, native_country_name) values ('PUE', 'Puerto-Rico');
insert into native_country_type (native_country_id, native_country_name) values ('CAN', 'Canada');
insert into native_country_type (native_country_id, native_country_name) values ('GER', 'Germany');
insert into native_country_type (native_country_id, native_country_name) values ('OUT', 'Outlying-US(Guam-USVI-etc)');
insert into native_country_type (native_country_id, native_country_name) values ('IND', 'India');
insert into native_country_type (native_country_id, native_country_name) values ('JAP', 'Japan');
insert into native_country_type (native_country_id, native_country_name) values ('GRE', 'Greece');
insert into native_country_type (native_country_id, native_country_name) values ('SOU', 'South');
insert into native_country_type (native_country_id, native_country_name) values ('CHI', 'China');
insert into native_country_type (native_country_id, native_country_name) values ('CUB', 'Cuba');
insert into native_country_type (native_country_id, native_country_name) values ('IRA', 'Iran');
insert into native_country_type (native_country_id, native_country_name) values ('HON', 'Honduras');
insert into native_country_type (native_country_id, native_country_name) values ('PHI', 'Philippines');
insert into native_country_type (native_country_id, native_country_name) values ('ITA', 'Italy');
insert into native_country_type (native_country_id, native_country_name) values ('POL', 'Poland');
insert into native_country_type (native_country_id, native_country_name) values ('JAM', 'Jamaica');
insert into native_country_type (native_country_id, native_country_name) values ('VIE', 'Vietnam');
insert into native_country_type (native_country_id, native_country_name) values ('MEX', 'Mexico');
insert into native_country_type (native_country_id, native_country_name) values ('POR', 'Portugal');
insert into native_country_type (native_country_id, native_country_name) values ('IRE', 'Ireland');
insert into native_country_type (native_country_id, native_country_name) values ('FRA', 'France');
insert into native_country_type (native_country_id, native_country_name) values ('DOM', 'Dominican-Republic');
insert into native_country_type (native_country_id, native_country_name) values ('LAO', 'Laos');
insert into native_country_type (native_country_id, native_country_name) values ('ECU', 'Ecuador');
insert into native_country_type (native_country_id, native_country_name) values ('TAI', 'Taiwan');
insert into native_country_type (native_country_id, native_country_name) values ('HAI', 'Haiti');
insert into native_country_type (native_country_id, native_country_name) values ('COL', 'Columbia');
insert into native_country_type (native_country_id, native_country_name) values ('HUN', 'Hungary');
insert into native_country_type (native_country_id, native_country_name) values ('GUA', 'Guatemala');
insert into native_country_type (native_country_id, native_country_name) values ('NIC', 'Nicaragua');
insert into native_country_type (native_country_id, native_country_name) values ('SCO', 'Scotland');
insert into native_country_type (native_country_id, native_country_name) values ('THA', 'Thailand');
insert into native_country_type (native_country_id, native_country_name) values ('YUG', 'Yugoslavia');
insert into native_country_type (native_country_id, native_country_name) values ('ELS', 'El-Salvador');
insert into native_country_type (native_country_id, native_country_name) values ('TNT', 'Trinadad&Tobago');
insert into native_country_type (native_country_id, native_country_name) values ('PER', 'Peru');
insert into native_country_type (native_country_id, native_country_name) values ('HOG', 'Hong');
insert into native_country_type (native_country_id, native_country_name) values ('HOL', 'Holand-Netherlands');
insert into native_country_type (native_country_id, native_country_name) values ('?', 'Unknown(?)');

create table resident 
(
resident_id integer not null primary key auto_increment,
age tinyint unsigned not null,
workclass_id char(1) not null,
fnlgwt mediumint unsigned not null,
education_id char(1) not null,
education_num tinyint unsigned not null,
marital_status_id char(1) not null,
occupation_id char(1) not null,
relationship_id char(1) not null,
race_id char(1) not null,
sex enum('M', 'F') not null,
capital_gain mediumint unsigned not null,
capital_loss mediumint unsigned not null,
hours_per_week tinyint unsigned not null,
native_country_id char(3) not null,
label enum('>50K', '<=50K') not null
);

load data local infile 'resident.data' into table resident fields terminated by ', ' lines terminated by '\n' (age, workclass_id, fnlgwt, education_id, education_num, marital_status_id, occupation_id, relationship_id, race_id, sex, capital_gain, capital_loss, hours_per_week, native_country_id, label);

create view resident_data as 
select
r.resident_id,
r.age,
w.workclass_name,
r.fnlgwt,
e.education_name,
r.education_num,
m.marital_status_name,
o.occupation_name,
l.relationship_name,
a.race_name,
r.sex,
r.capital_gain,
r.capital_loss,
r.hours_per_week,
n.native_country_name,
label
from
resident as r inner join
workclass_type as w inner join
education_type as e inner join
marital_status_type as m inner join
occupation_type as o inner join
relationship_type as l inner join
race_type as a inner join
native_country_type as n
on
r.workclass_id = w.workclass_id
and
r.education_id = e.education_id
and
r.marital_status_id = m.marital_status_id
and
r.occupation_id = o.occupation_id
and
r.relationship_id = l.relationship_id
and
r.race_id = a.race_id
and
r.native_country_id = n.native_country_id;


