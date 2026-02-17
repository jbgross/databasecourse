-- homework 2.sql
-- use courses-small.sql to create tables.

-- 1.  List the course id and title for courses that have 
--     "System" or "Computer" in their title.  Order the list by course id.
--     Answer: 3 rows
select 1;

-- 2.  List the id and name of instructors whose name
--     start with the letter "S".  Sort the list by name.
--     Answer: 2 rows
select 2;

-- 3.  Return a list of all courses with the department name and 
--     the 3 digit number of the course labeled as "course_number".
--     Order the list by department name and course number.
--     The first row of the result would be 
--     DEPT_NAME   COURSE_NUMBER
--     Biology     101 
select 3;

-- 4.  Use the BETWEEN predicate to show the student ID and name 
--     of students who have total credits in the range 50 to 90 inclusive.
--     The result should be sorted by ID.
select 4;

-- 5. List all columns of upper division courses from the course table.
--    An upper division course has a number >= 300.
--    List the courses in order by dept_name and then course_id. 
select 5;

-- 6. List all the buildings used to teach classes from the sections table.
--    Do not list duplicates.  List the buildings alphabetically.
select 6;

-- 7.  show the instructor id and the course_id taught by the instructor.
--     If an instructor taught a course multiple times, don't list duplicates.
--     Sort the results by instructor ID, then course_id.
select 7;

-- 8.  for each instructor show their ID, name, monthly salary (salary divided by 12 rounded to integer) 
--     labeled as "monthly_salary".  Order the result by monthly salary largest to smallest. 
select 8;

-- 9.  Use the section table to list all Computer Science courses taught in Spring 2009.
--     List the course_id, sec_id, building and room_number.
--     Order the result by course_id then sec_id.
select 9;

-- 10. Which students have a null value for grade? 
--     Return the student id, course_id, year, semester in order by id;
select 10;
               