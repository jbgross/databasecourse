-- homework 1.sql
-- use courses-small.sql to create tables.

-- 1. Show the name and salary of all instructors sorted by name.
SELECT ...;


-- 2. Show all columns for instructors in the 'Comp. Sci.' department in order by name.
--    Answer:  has 3 rows: Brandt, Katz, Srinivasan
SELECT ...;

-- 3. Show name, salary, department for instructors with salaries less than $50,000 in order by name.
--    Answer:  1 row for Mozart
SELECT ...;

-- 4. Show the student name, major department and total credits for 
--    students with at least 98 credits.  Sort the list by total credits.
--    Answer: 4 rows
SELECT ...;

-- 5. (2 pts) Show the student ID and name for students who are majoring in  
--    'Elec. Eng.' or 'Comp. Sci.'  and have at least 90 credits.  Sort the list by ID.
--    Answer:  2 rows.  Zhang and Bourikas
SELECT ...;

-- 6. Show the  ID, name and salary for all instructors.
--    Order by salary highest to lowest.
SELECT ...;

-- 7. (2 pts) List the course_id and title for courses that have 
-- "System" or "Computer" in their title. Order the list by course_id.
--  Answer has 3 rows
SELECT ...;

-- 8. List the instructor_id and name of instructors whose name start with
-- the letter "S". Sort the list by name.
--    Answer has 2 rows
SELECT ...;

-- 9. Return a list of all course ids and credits. Use CONCAT with an 
-- alias so there is a single column called course_credits that looks like:
-- course_credits
-- BIO-399: 3 units
-- Order the list by depart_name and credits (units).

SELECT ...;

-- 10. Use the BETWEEN predicate to show the student_id and student_name of 
-- students who have total credits in the range 50 to 90 inclusive. The result 
-- should be sorted by student_id.
SELECT ...;

-- 11. List all the buildings used to teach classes from the sections 
-- table. Do not list duplicates. List the buildings alphabetically.
SELECT DISTINCT ...;


-- 12. Show the instructor_id and the course_id taught by the instructor. If an 
-- instructor taught a course multiple times, don't list duplicates. Sort the results 
-- by instructor_id, then course_id.
SELECT DISTINCT ...; 


-- 13. (2 pts) For each instructor show the instructor_id, instructor_name, 
-- monthly salary (salary divided by 12 rounded to integer) 
-- labeled as "monthly_salary". Order the result by monthly salary largest to 
-- smallest. Hint: use an alias for monthly salary
SELECT ...;


-- 14. (2 pts) Use the section table to list all Computer Science 
-- courses taught in Spring 2009. List the course_id, section_id, 
-- building and room_number. Order the result by course_id then section_id.
SELECT ...;

-- 15. (2 pts) Which students have a NULL value for grade? Return the student_id, 
-- course_id, section_year, semester in order by student_id;
SELECT ...;
