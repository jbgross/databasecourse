-- homework 3.sql
-- The tables used in this exercise come from 'courses-small.sql';

-- 1.  List the Comp. Sci. courses taught in Spring 2009.
--     List the course id, title in order by course_id.
select 1;

-- 2.  For the spring 2009 semester, show the department name
--     and number of students enrolled in courses from each department
--     Label the number of students as "enrollment". 
--     Order the result by department name.
select 2;

-- 3.  List all instructors ID , name and department with the number of courses taught with the 
--     label "courses_taught".   If an instructor did not teach, they are listed with a value of 0.
--     Order by result by ID.  A correct result will have 3 instructors with 0 courses. 
select 3;

-- 4.  List the student majors (student.dept_name) and the number of students in each major
--     with the label "count" in order by major.
select 4;

-- 5.  Same as #4 but only list majors with more than 2 students.
select 5;

-- 6.  List all departments and the number of students majoring in that department (use label "count")
--      and have more than 90 total credits.  Order by department name.
--      Answer:  7 department rows. History, Music and Physics departments have 0 students 
select 6;

-- 7.  show the instructor id, name, course title and number of times taught. 
--     label the output columns id, name, title, count. 
--     order the result by id, then title.
--     List all instructor.  If an instructor has not taught any courses
--     then list title as null and count as 0. 
--     Answer:  Gold, Califeri and Singh have not taught courses.
select 7;

-- 8.  List students ID and name with more than 90 credits or have taken more than 2 courses. 
--     order the result by ID.
--     Hint: Use UNION operator.
--     Answer:  6 rows
select 8;

-- 9. Calculate the GPA for each student. 
--    Multiply the sum of numeric value of the grade times the course credits 
--    and divide by the sum of course credits for all courses taken.
--    The numeric value of a grade can be found in the grade_points table.
--    The course credit value is in the course table.
--    label the columns id, name, gpa and list the rows by student id
--    Answer:  Zhang has a gpa 3.87143, Snow has a null gpa
select 9;
