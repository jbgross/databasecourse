-- Week 4 JOIN HW Solution  
-- The tables used in this exercise come FROM 'courses-small.sql';

-- 1.  List the Comp. Sci. courses taught in Spring 2009.
--     List the course id, title ordered by course_id;
--     Answer:  2 rows
SELECT DISTINCT c.course_id, c.title 
FROM course c JOIN section s ON c.course_id=s.course_id 
WHERE s.year=2009 AND s.semester='Spring' AND c.dept_name='Comp. Sci.' 
ORDER BY c.course_id;


-- 2.  For the spring 2009 semester, show the department name
--     AND number of students enrolled in courses FROM each department
--     Label the number of students as "enrollment". Order the result by 
--     department name.
SELECT c.dept_name, count(*) as enrollment
FROM course c JOIN takes t ON c.course_id=t.course_id
WHERE year = 2009 AND semester = 'Spring' 
GROUP BY c.dept_name
ORDER BY c.dept_name;

-- 3.  List all instructors ID , name AND department with the number of courses taught with the 
--     label "courses_taught".   If an instructor did not teach, they are listed with a value of 0.
--     ORDER BY result by ID.  A correct result will have 3 instructors with 0 courses. 
SELECT inst.id, inst.name, inst.dept_name, count(t.course_id) as courses_taught
FROM instructor inst left JOIN teaches t ON inst.id=t.id
GROUP BY inst.id
ORDER BY inst.id;

-- 4.  List the student majors (student.dept_name) AND the number of students in each major
--     with the label "count" in ORDER BY major.
SELECT dept_name, count(*) as count
FROM student
GROUP BY dept_name
ORDER BY dept_name;

-- 5.  Same as #4 but only list majors with more than 2 students.
SELECT dept_name, count(*) as count
FROM student
GROUP BY dept_name
having count > 2
ORDER BY dept_name;

-- 6.  List all departments AND the number of students majoring in that department (use label "count")
--      AND have more than 90 total credits.  ORDER BY department name.
--      Answer:  7 department rows. History, Music AND Physics departments have 0 students 
SELECT d.dept_name, count(s.id) as count
FROM department d left JOIN student s ON d.dept_name=s.dept_name AND s.tot_cred>90
GROUP BY d.dept_name
ORDER BY d.dept_name;

-- 7.  show the instructor id, name, course title AND number of times taught. 
--     label the output columns id, name, title, count. 
--     order the result by id, then title.
--     List all instructor.  If an instructor has not taught any courses
--     then list title as null AND count as 0. 
--     Answer:  Gold, Califeri AND Singh have not taught courses.
SELECT inst.id, inst.name, c.title, count(c.course_id) as count
FROM instructor inst left JOIN teaches t ON inst.id=t.id 
     left JOIN course c ON c.course_id=t.course_id
GROUP BY inst.id, c.title
ORDER BY inst.id, c.title;

-- 8.  List students ID AND name with more than 90 credits or have taken more than 2 courses. 
--     order the result by ID.
--     Hint: Use UNION operator.
--     Answer:  6 rows
SELECT id, name FROM student WHERE tot_cred > 90
union 
SELECT id, name FROM student JOIN takes using(id)
GROUP BY id, name
having count(*) > 2
ORDER BY id;

-- 9. Calculate the GPA for each student. 
--    Multiply the sum of numeric value of the grade times the course credits 
--    AND divide by the sum of course credits for all courses taken.
--    The numeric value of a grade can be found in the grade_points table.
--    The course credit value is in the course table.
--    label the columns id, name, gpa
--    list the output rows in ORDER BY student id
--    Answer:  Zhang has a gpa 3.87143, Snow has a null gpa
SELECT s.id, s.name, sum(points*credits)/sum(credits) as gpa
FROM student s left JOIN takes t ON s.id=t.id
     left JOIN grade_points gp ON t.grade=gp.grade
     left JOIN course c ON  t.course_id=c.course_id
GROUP BY s.id
ORDER BY s.id;
