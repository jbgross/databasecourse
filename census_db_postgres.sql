DROP DATABASE IF EXISTS census;
CREATE DATABASE census;
\connect census

DROP VIEW IF EXISTS resident_data;
DROP TABLE IF EXISTS resident;
DROP TABLE IF EXISTS workclass_type;
DROP TABLE IF EXISTS education_type;
DROP TABLE IF EXISTS marital_status_type;
DROP TABLE IF EXISTS occupation_type;
DROP TABLE IF EXISTS relationship_type;
DROP TABLE IF EXISTS race_type;
DROP TABLE IF EXISTS native_country_type;

CREATE TABLE workclass_type
(
workclass_id char(1) not null primary key,
workclass_name varchar(64) not null unique
);

INSERT INTO workclass_type (workclass_id, workclass_name) VALUES ('P', 'Private');
INSERT INTO workclass_type (workclass_id, workclass_name) VALUES ('S', 'Self-emp-not-inc');
INSERT INTO workclass_type (workclass_id, workclass_name) VALUES ('I', 'Self-emp-inc');
INSERT INTO workclass_type (workclass_id, workclass_name) VALUES ('F', 'Federal-gov');
INSERT INTO workclass_type (workclass_id, workclass_name) VALUES ('L', 'Local-gov');
INSERT INTO workclass_type (workclass_id, workclass_name) VALUES ('T', 'State-gov');
INSERT INTO workclass_type (workclass_id, workclass_name) VALUES ('W', 'Without-pay');
INSERT INTO workclass_type (workclass_id, workclass_name) VALUES ('N', 'Never-worked');
INSERT INTO workclass_type (workclass_id, workclass_name) VALUES ('?', 'Unknown(?)');

CREATE TABLE education_type
(
education_id char(1) not null primary key,
education_name varchar(64) not null unique
);

INSERT INTO education_type (education_id, education_name) VALUES ('B', 'Bachelors');
INSERT INTO education_type (education_id, education_name) VALUES ('S', 'Some-college');
INSERT INTO education_type (education_id, education_name) VALUES ('1', '11th');
INSERT INTO education_type (education_id, education_name) VALUES ('H', 'HS-grad');
INSERT INTO education_type (education_id, education_name) VALUES ('P', 'Prof-school');
INSERT INTO education_type (education_id, education_name) VALUES ('A', 'Assoc-acdm');
INSERT INTO education_type (education_id, education_name) VALUES ('V', 'Assoc-voc');
INSERT INTO education_type (education_id, education_name) VALUES ('9', '9th');
INSERT INTO education_type (education_id, education_name) VALUES ('7', '7th-8th');
INSERT INTO education_type (education_id, education_name) VALUES ('2', '12th');
INSERT INTO education_type (education_id, education_name) VALUES ('M', 'Masters');
INSERT INTO education_type (education_id, education_name) VALUES ('4', '1st-4th');
INSERT INTO education_type (education_id, education_name) VALUES ('0', '10th');
INSERT INTO education_type (education_id, education_name) VALUES ('D', 'Doctorate');
INSERT INTO education_type (education_id, education_name) VALUES ('5', '5th-6th');
INSERT INTO education_type (education_id, education_name) VALUES ('R', 'Preschool');

CREATE TABLE marital_status_type
(
marital_status_id char(1) not null primary key,
marital_status_name varchar(64) not null unique
);

INSERT INTO marital_status_type (marital_status_id, marital_status_name) VALUES ('M', 'Married-civ-spouse');
INSERT INTO marital_status_type (marital_status_id, marital_status_name) VALUES ('D', 'Divorced');
INSERT INTO marital_status_type (marital_status_id, marital_status_name) VALUES ('N', 'Never-married');
INSERT INTO marital_status_type (marital_status_id, marital_status_name) VALUES ('S', 'Separated');
INSERT INTO marital_status_type (marital_status_id, marital_status_name) VALUES ('W', 'Widowed');
INSERT INTO marital_status_type (marital_status_id, marital_status_name) VALUES ('A', 'Married-spouse-absent');
INSERT INTO marital_status_type (marital_status_id, marital_status_name) VALUES ('F', 'Married-AF-spouse');

CREATE TABLE occupation_type
(
occupation_id char(1) not null primary key,
occupation_name varchar(64) not null unique
);

INSERT INTO occupation_type (occupation_id, occupation_name) VALUES ('T', 'Tech-support');
INSERT INTO occupation_type (occupation_id, occupation_name) VALUES ('C', 'Craft-repair');
INSERT INTO occupation_type (occupation_id, occupation_name) VALUES ('O', 'Other-service');
INSERT INTO occupation_type (occupation_id, occupation_name) VALUES ('L', 'Sales');
INSERT INTO occupation_type (occupation_id, occupation_name) VALUES ('E', 'Exec-managerial');
INSERT INTO occupation_type (occupation_id, occupation_name) VALUES ('P', 'Prof-specialty');
INSERT INTO occupation_type (occupation_id, occupation_name) VALUES ('H', 'Handlers-cleaners');
INSERT INTO occupation_type (occupation_id, occupation_name) VALUES ('M', 'Machine-op-inspct');
INSERT INTO occupation_type (occupation_id, occupation_name) VALUES ('A', 'Adm-clerical');
INSERT INTO occupation_type (occupation_id, occupation_name) VALUES ('F', 'Farming-fishing');
INSERT INTO occupation_type (occupation_id, occupation_name) VALUES ('N', 'Transport-moving');
INSERT INTO occupation_type (occupation_id, occupation_name) VALUES ('S', 'Priv-house-serv');
INSERT INTO occupation_type (occupation_id, occupation_name) VALUES ('R', 'Protective-serv');
INSERT INTO occupation_type (occupation_id, occupation_name) VALUES ('D', 'Armed-Forces');
INSERT INTO occupation_type (occupation_id, occupation_name) VALUES ('?', 'Unknown(?)');

CREATE TABLE relationship_type
(
relationship_id char(1) not null primary key,
relationship_name varchar(64) not null unique
);

INSERT INTO relationship_type (relationship_id, relationship_name) VALUES ('W', 'Wife');
INSERT INTO relationship_type (relationship_id, relationship_name) VALUES ('O', 'Own-child');
INSERT INTO relationship_type (relationship_id, relationship_name) VALUES ('H', 'Husband');
INSERT INTO relationship_type (relationship_id, relationship_name) VALUES ('N', 'Not-in-family');
INSERT INTO relationship_type (relationship_id, relationship_name) VALUES ('R', 'Other-relative');
INSERT INTO relationship_type (relationship_id, relationship_name) VALUES ('U', 'Unmarried');

CREATE TABLE race_type
(
race_id char(1) not null primary key,
race_name varchar(64) not null unique
);

INSERT INTO race_type (race_id, race_name) VALUES ('W', 'White');
INSERT INTO race_type (race_id, race_name) VALUES ('A', 'Asian-Pac-Islander');
INSERT INTO race_type (race_id, race_name) VALUES ('I', 'Amer-Indian-Eskimo');
INSERT INTO race_type (race_id, race_name) VALUES ('O', 'Other');
INSERT INTO race_type (race_id, race_name) VALUES ('B', 'Black');

CREATE TABLE native_country_type
(
native_country_id char(3) not null primary key,
native_country_name varchar(64) not null unique
);

INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('USA', 'United-States');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('CAM', 'Cambodia');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('ENG', 'England');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('PUE', 'Puerto-Rico');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('CAN', 'Canada');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('GER', 'Germany');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('OUT', 'Outlying-US(Guam-USVI-etc)');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('IND', 'India');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('JAP', 'Japan');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('GRE', 'Greece');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('SOU', 'South');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('CHI', 'China');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('CUB', 'Cuba');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('IRA', 'Iran');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('HON', 'Honduras');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('PHI', 'Philippines');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('ITA', 'Italy');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('POL', 'Poland');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('JAM', 'Jamaica');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('VIE', 'Vietnam');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('MEX', 'Mexico');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('POR', 'Portugal');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('IRE', 'Ireland');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('FRA', 'France');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('DOM', 'Dominican-Republic');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('LAO', 'Laos');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('ECU', 'Ecuador');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('TAI', 'Taiwan');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('HAI', 'Haiti');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('COL', 'Columbia');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('HUN', 'Hungary');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('GUA', 'Guatemala');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('NIC', 'Nicaragua');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('SCO', 'Scotland');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('THA', 'Thailand');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('YUG', 'Yugoslavia');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('ELS', 'El-Salvador');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('TNT', 'Trinadad&Tobago');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('PER', 'Peru');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('HOG', 'Hong');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('HOL', 'Holand-Netherlands');
INSERT INTO native_country_type (native_country_id, native_country_name) VALUES ('?', 'Unknown(?)');

CREATE TABLE resident
(
resident_id integer generated by default as identity primary key,
age smallint not null check (age >= 0),
workclass_id char(1) not null,
fnlgwt integer not null check (fnlgwt >= 0),
education_id char(1) not null,
education_num smallint not null check (education_num >= 0),
marital_status_id char(1) not null,
occupation_id char(1) not null,
relationship_id char(1) not null,
race_id char(1) not null,
sex char(1) not null check (sex in ('M', 'F')),
capital_gain integer not null check (capital_gain >= 0),
capital_loss integer not null check (capital_loss >= 0),
hours_per_week smallint not null check (hours_per_week >= 0),
native_country_id char(3) not null,
label varchar(5) not null check (label in ('>50K', '<=50K')),
foreign key (workclass_id) references workclass_type (workclass_id),
foreign key (education_id) references education_type (education_id),
foreign key (marital_status_id) references marital_status_type (marital_status_id),
foreign key (occupation_id) references occupation_type (occupation_id),
foreign key (relationship_id) references relationship_type (relationship_id),
foreign key (race_id) references race_type (race_id),
foreign key (native_country_id) references native_country_type (native_country_id)
);

\copy resident(age, workclass_id, fnlgwt, education_id, education_num, marital_status_id, occupation_id, relationship_id, race_id, sex, capital_gain, capital_loss, hours_per_week, native_country_id, label) FROM 'resident.data' WITH (FORMAT csv)

CREATE VIEW resident_data AS
SELECT
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
r.label
FROM resident AS r
INNER JOIN workclass_type AS w ON r.workclass_id = w.workclass_id
INNER JOIN education_type AS e ON r.education_id = e.education_id
INNER JOIN marital_status_type AS m ON r.marital_status_id = m.marital_status_id
INNER JOIN occupation_type AS o ON r.occupation_id = o.occupation_id
INNER JOIN relationship_type AS l ON r.relationship_id = l.relationship_id
INNER JOIN race_type AS a ON r.race_id = a.race_id
INNER JOIN native_country_type AS n ON r.native_country_id = n.native_country_id;
