-- Ensure you have a new database and are connected to it
-- (done outside this script)

CREATE TABLE classroom (
    building        VARCHAR(15),
    room_number     VARCHAR(7),
    capacity        NUMERIC(4,0),
    PRIMARY KEY (building, room_number)
);

CREATE TABLE department (
    dept_name       VARCHAR(20), 
    building        VARCHAR(15), 
    budget          NUMERIC(12,2) CHECK (budget > 0),
    PRIMARY KEY (dept_name)
);


CREATE TABLE course (
    course_id       VARCHAR(8), 
    title           VARCHAR(50), 
    dept_name       VARCHAR(20),
    credits         NUMERIC(2,0) CHECK (credits > 0),
    PRIMARY KEY (course_id),
    CONSTRAINT course1 FOREIGN KEY (dept_name) 
        REFERENCES department(dept_name) 
        ON DELETE SET NULL
);

CREATE TABLE instructor (
    instructor_id       VARCHAR(5), 
    instructor_name     VARCHAR(20) NOT NULL, 
    dept_name           VARCHAR(20), 
    salary              NUMERIC(8,2) CHECK (salary > 29_000),
    PRIMARY KEY (instructor_id),
    CONSTRAINT instructor1 FOREIGN KEY (dept_name) 
        REFERENCES department(dept_name) 
        ON DELETE SET NULL
);

CREATE TABLE section (
    course_id       VARCHAR(8), 
    section_id      VARCHAR(8),
    semester        VARCHAR(6) CHECK (semester IN ('Fall', 'Winter', 'Spring', 'Summer')), 
    section_year    NUMERIC(4,0) CHECK (section_year > 1701 AND section_year < 2100), 
    building        VARCHAR(15),
    room_number     VARCHAR(7),
    time_slot_id    VARCHAR(4),
    PRIMARY KEY (course_id, section_id, semester, section_year),
    CONSTRAINT section1 FOREIGN KEY (course_id) 
        REFERENCES course(course_id) 
        ON DELETE CASCADE,
    CONSTRAINT section2 FOREIGN KEY (building, room_number) 
        REFERENCES classroom(building, room_number) 
        ON DELETE SET NULL
);

CREATE TABLE teaches (
    instructor_id       VARCHAR(5), 
    course_id           VARCHAR(8),
    section_id          VARCHAR(8), 
    semester            VARCHAR(6),
    section_year        NUMERIC(4,0),
    PRIMARY KEY (instructor_id, course_id, section_id, semester, section_year),
    CONSTRAINT teaches1 FOREIGN KEY (course_id, section_id, semester, section_year) 
        REFERENCES section(course_id, section_id, semester, section_year) 
        ON DELETE CASCADE,
    CONSTRAINT teaches2 FOREIGN KEY (instructor_id) 
        REFERENCES instructor(instructor_id) 
        ON DELETE CASCADE
);

CREATE TABLE student (
    student_id      VARCHAR(5), 
    student_name    VARCHAR(20) NOT NULL, 
    dept_name       VARCHAR(20), 
    tot_cred        NUMERIC(3,0) CHECK (tot_cred >= 0),
    PRIMARY KEY (student_id ),
    CONSTRAINT student1 FOREIGN KEY (dept_name) 
        REFERENCES department(dept_name) 
        ON DELETE SET NULL
);

CREATE TABLE takes (
    student_id      VARCHAR(5), 
    course_id       VARCHAR(8),
    section_id      VARCHAR(8), 
    semester        VARCHAR(6),
    section_year    NUMERIC(4,0),
    grade           VARCHAR(2),
    PRIMARY KEY (student_id, course_id, section_id, semester, section_year),
    CONSTRAINT takes1 FOREIGN KEY (course_id, section_id, semester, section_year)
        REFERENCES section (course_id, section_id, semester, section_year)
        ON DELETE CASCADE,
    CONSTRAINT takes2 FOREIGN KEY (student_id) REFERENCES student(student_id) 
        ON DELETE CASCADE
);

CREATE TABLE advisor (
    student_id          VARCHAR(5),
    instructor_id       VARCHAR(5),
    PRIMARY KEY (student_id),
    CONSTRAINT advisor1 FOREIGN KEY (instructor_id) 
        REFERENCES instructor(instructor_id) 
        ON DELETE SET NULL,
    CONSTRAINT advisor2 FOREIGN KEY (student_id) 
        REFERENCES student(student_id) 
        ON DELETE CASCADE
);

CREATE TABLE time_slot_detail (
    time_slot_id    VARCHAR(4),
    time_slot_day   VARCHAR(1),
    start_hr        NUMERIC(2) CHECK (start_hr >= 0 AND start_hr < 24),
    start_min       NUMERIC(2) CHECK (start_min >= 0 AND start_min < 60),
    end_hr          NUMERIC(2) CHECK (end_hr >= 0 AND end_hr < 24),
    end_min         NUMERIC(2) CHECK (end_min >= 0 AND end_min < 60),
    PRIMARY KEY (time_slot_id, time_slot_day, start_hr, start_min)
);

-- formatted version of time slots
CREATE TABLE time_slot_f (
    time_slot_id    VARCHAR(4) PRIMARY KEY, 
    day_time        VARCHAR(25)
);

-- course–prerequisite relationship
CREATE TABLE prereq (
    course_id       VARCHAR(8), 
    prereq_id       VARCHAR(8),
    PRIMARY KEY (course_id, prereq_id),
    CONSTRAINT prereq1 FOREIGN KEY (course_id) 
        REFERENCES course(course_id) 
        ON DELETE CASCADE,
    CONSTRAINT prereq2 FOREIGN KEY (prereq_id) 
        REFERENCES course(course_id)
);

CREATE TABLE grade_points (
    grade       VARCHAR(2) PRIMARY KEY,
    points      NUMERIC(2, 1)
);

CREATE TABLE semester (
    semester_sequence   INT NOT NULL, 
    semester            VARCHAR(6) CHECK (semester IN ('Fall', 'Winter', 'Spring', 'Summer')),
    semester_year       INT NOT NULL,
    PRIMARY KEY (semester_sequence, semester_year)
);

INSERT INTO semester (semester_sequence, semester, semester_year) VALUES
    (1, 'Spring', 2001),
    (2, 'Fall',   2001), 
    (3, 'Spring', 2002),
    (4, 'Fall',   2002), 
    (5, 'Spring', 2003),
    (6, 'Fall',   2003), 
    (7, 'Spring', 2004),
    (8, 'Fall',   2004),
    (9, 'Spring', 2005),
    (10, 'Fall',   2005), 
    (11, 'Spring', 2006),
    (12, 'Fall',   2006),  
    (13, 'Spring', 2007),
    (14, 'Fall',   2007), 
    (15, 'Spring', 2008),
    (16, 'Fall',   2008), 
    (17, 'Spring', 2009),
    (18, 'Fall',   2009), 
    (19, 'Spring', 2010),
    (20, 'Fall',   2010);

INSERT INTO classroom (building, room_number, capacity) VALUES
	('Packard', '101', 500),
	('Painter', '514', 10),
	('Taylor', '3128', 70),
	('Watson', '100', 30),
	('Watson', '120', 50);

INSERT INTO department (dept_name, building, budget) VALUES
	('Biology', 'Watson', 90_000),
	('Comp. Sci.', 'Taylor', 100_000),
	('Elec. Eng.', 'Taylor', 85_000),
	('Finance', 'Painter', 120_000),
	('History', 'Painter', 50_000),
	('Music', 'Packard', 80_000),
	('Physics', 'Watson', 70_000);

INSERT INTO course (course_id, title, dept_name, credits) VALUES
	('BIO-101', 'Intro. to Biology', 'Biology', 4),
	('BIO-301', 'Genetics', 'Biology', 4),
	('BIO-399', 'Computational Biology', 'Biology', 3),
	('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4),
	('CS-190', 'Game Design', 'Comp. Sci.', 4),
	('CS-315', 'Robotics', 'Comp. Sci.', 3),
	('CS-319', 'Image Processing', 'Comp. Sci.', 3),
	('CS-347', 'Database System Concepts', 'Comp. Sci.', 3),
	('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3),
	('FIN-201', 'Investment Banking', 'Finance', 3),
	('HIS-351', 'World History', 'History', 3),
	('MU-199', 'Music Video Production', 'Music', 3),
	('PHY-101', 'Physical Principles', 'Physics', 4);

INSERT INTO instructor (instructor_id, instructor_name, dept_name, salary) VALUES
	('10101', 'Srinivasan', 'Comp. Sci.', 65_000),
	('12121', 'Wu', 'Finance', 90_000),
	('15151', 'Mozart', 'Music', 40_000),
	('22222', 'Einstein', 'Physics', 95_000),
	('32343', 'El Said', 'History', 60_000),
	('33456', 'Gold', 'Physics', 87_000),
	('45565', 'Katz', 'Comp. Sci.', 75_000),
	('58583', 'Califieri', 'History', 62_000),
	('76543', 'Singh', 'Finance', 80_000),
	('76766', 'Crick', 'Biology', 72_000),
	('83821', 'Brandt', 'Comp. Sci.', 92_000),
	('98345', 'Kim', 'Elec. Eng.', 80_000);

INSERT INTO section (course_id, section_id, semester, section_year, building, room_number, time_slot_id) VALUES
    ('BIO-101', '1', 'Summer', 2009, 'Painter', '514', 'B'),
    ('BIO-301', '1', 'Summer', 2010, 'Painter', '514', 'A'),
    ('CS-101', '1', 'Fall', 2009, 'Packard', '101', 'H'),
    ('CS-101', '1', 'Spring', 2010, 'Packard', '101', 'F'),
    ('CS-190', '1', 'Spring', 2009, 'Taylor', '3128', 'E'),
    ('CS-190', '2', 'Spring', 2009, 'Taylor', '3128', 'A'),
    ('CS-315', '1', 'Spring', 2010, 'Watson', '120', 'D'),
    ('CS-319', '1', 'Spring', 2010, 'Watson', '100', 'B'),
    ('CS-319', '2', 'Spring', 2010, 'Taylor', '3128', 'C'),
    ('CS-347', '1', 'Fall', 2009, 'Taylor', '3128', 'A'),
    ('EE-181', '1', 'Spring', 2009, 'Taylor', '3128', 'C'),
    ('FIN-201', '1', 'Spring', 2010, 'Packard', '101', 'B'),
    ('HIS-351', '1', 'Spring', 2010, 'Painter', '514', 'C'),
    ('MU-199', '1', 'Spring', 2010, 'Packard', '101', 'D'),
    ('PHY-101', '1', 'Fall', 2009, 'Watson', '100', 'A');

INSERT INTO teaches (instructor_id, course_id, section_id, semester, section_year) VALUES
    ('10101', 'CS-101', '1', 'Fall', 2009),
    ('10101', 'CS-315', '1', 'Spring', 2010),
    ('10101', 'CS-347', '1', 'Fall', 2009),
    ('12121', 'FIN-201', '1', 'Spring', 2010),
    ('15151', 'MU-199', '1', 'Spring', 2010),
    ('22222', 'PHY-101', '1', 'Fall', 2009),
    ('32343', 'HIS-351', '1', 'Spring', 2010),
    ('45565', 'CS-101', '1', 'Spring', 2010),
    ('45565', 'CS-319', '1', 'Spring', 2010),
    ('76766', 'BIO-101', '1', 'Summer', 2009),
    ('76766', 'BIO-301', '1', 'Summer', 2010),
    ('83821', 'CS-190', '1', 'Spring', 2009),
    ('83821', 'CS-190', '2', 'Spring', 2009),
    ('83821', 'CS-319', '2', 'Spring', 2010),
    ('98345', 'EE-181', '1', 'Spring', 2009);

INSERT INTO student (student_id, student_name, dept_name, tot_cred) VALUES
    ('00128', 'Zhang', 'Comp. Sci.', 102),
    ('12345', 'Shankar', 'Comp. Sci.', 32),
    ('19991', 'Brandt', 'History', 80),
    ('23121', 'Chavez', 'Finance', 110),
    ('44553', 'Peltier', 'Physics', 56),
    ('45678', 'Levy', 'Physics', 46),
    ('54321', 'Williams', 'Comp. Sci.', 54),
    ('55739', 'Sanchez', 'Music', 38),
    ('70557', 'Snow', 'Physics', 0),
    ('76543', 'Brown', 'Comp. Sci.', 58),
    ('76653', 'Aoi', 'Elec. Eng.', 60),
    ('98765', 'Bourikas', 'Elec. Eng.', 98),
    ('98988', 'Tanaka', 'Biology', 120);

INSERT INTO takes (student_id, course_id, section_id, semester, section_year, grade) VALUES
    ('00128', 'CS-101', '1', 'Fall', 2009, 'A'),
    ('00128', 'CS-347', '1', 'Fall', 2009, 'A-'),
    ('12345', 'CS-101', '1', 'Fall', 2009, 'C'),
    ('12345', 'CS-190', '2', 'Spring', 2009, 'A'),
    ('12345', 'CS-315', '1', 'Spring', 2010, 'A'),
    ('12345', 'CS-347', '1', 'Fall', 2009, 'A'),
    ('19991', 'HIS-351', '1', 'Spring', 2010, 'B'),
    ('23121', 'FIN-201', '1', 'Spring', 2010, 'C+'),
    ('44553', 'PHY-101', '1', 'Fall', 2009, 'B-'),
    ('45678', 'CS-101', '1', 'Fall', 2009, 'F'),
    ('45678', 'CS-101', '1', 'Spring', 2010, 'B+'),
    ('45678', 'CS-319', '1', 'Spring', 2010, 'B'),
    ('54321', 'CS-101', '1', 'Fall', 2009, 'A-'),
    ('54321', 'CS-190', '2', 'Spring', 2009, 'B+'),
    ('55739', 'MU-199', '1', 'Spring', 2010, 'A-'),
    ('76543', 'CS-101', '1', 'Fall', 2009, 'A'),
    ('76543', 'CS-319', '2', 'Spring', 2010, 'A'),
    ('76653', 'EE-181', '1', 'Spring', 2009, 'C'),
    ('98765', 'CS-101', '1', 'Fall', 2009, 'C-'),
    ('98765', 'CS-315', '1', 'Spring', 2010, 'B'),
    ('98988', 'BIO-101', '1', 'Summer', 2009, 'A'),
    ('98988', 'BIO-301', '1', 'Summer', 2010, NULL);

INSERT INTO advisor (student_id, instructor_id) VALUES
    ('00128', '45565'),
    ('12345', '10101'),
    ('23121', '76543'),
    ('44553', '22222'),
    ('45678', '22222'),
    ('76543', '45565'),
    ('76653', '98345'),
    ('98765', '98345'),
    ('98988', '76766');

INSERT INTO time_slot_detail (time_slot_id, time_slot_day, start_hr, start_min, end_hr, end_min) VALUES
    ('A', 'M', 8, 0, 8, 50),
    ('A', 'W', 8, 0, 8, 50),
    ('A', 'F', 8, 0, 8, 50),
    ('B', 'M', 9, 0, 9, 50),
    ('B', 'W', 9, 0, 9, 50),
    ('B', 'F', 9, 0, 9, 50),
    ('C', 'M', 11, 0, 11, 50),
    ('C', 'W', 11, 0, 11, 50),
    ('C', 'F', 11, 0, 11, 50),
    ('D', 'M', 13, 0, 13, 50),
    ('D', 'W', 13, 0, 13, 50),
    ('D', 'F', 13, 0, 13, 50),
    ('E', 'T', 10, 30, 11, 45),
    ('E', 'R', 10, 30, 11, 45),
    ('F', 'T', 14, 30, 15, 45),
    ('F', 'R', 14, 30, 15, 45),
    ('G', 'M', 16, 0, 16, 50),
    ('G', 'W', 16, 0, 16, 50),
    ('G', 'F', 16, 0, 16, 50),
    ('H', 'W', 10, 0, 12, 30);

INSERT INTO prereq (course_id, prereq_id) VALUES
    ('BIO-301', 'BIO-101'),
    ('BIO-399', 'BIO-101'),
    ('CS-190', 'CS-101'),
    ('CS-315', 'CS-101'),
    ('CS-319', 'CS-101'),
    ('CS-347', 'CS-101'),
    ('EE-181', 'PHY-101');

INSERT INTO grade_points (grade, points) VALUES
    ('A+', 4.2),
    ('A', 4.0),
    ('A-', 3.7),
    ('B+', 3.3),
    ('B', 3.0),
    ('B-', 2.7),
    ('C+', 2.3),
    ('C', 2.0),
    ('C-', 1.7),
    ('F', 0.0);

INSERT INTO time_slot_f (time_slot_id, day_time) VALUES
    ('A', 'MWF 8:00am - 8:50am'),
    ('B', 'MWF 9:00am - 9:50am'),
    ('C', 'MWF 11:00am - 11:50am'),
    ('D', 'MWF 1:00pm - 1:50pm'),
    ('E', 'TR 10:30am - 11:45am'),
    ('F', 'TR 2:30pm - 3:45pm'),
    ('G', 'MWF 4:00pm - 4:50pm'),
    ('H', 'W 10:00am - 12:30pm');
