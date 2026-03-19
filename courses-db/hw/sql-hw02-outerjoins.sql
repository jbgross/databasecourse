-- 1. (2 pts) List the Comp. Sci. courses taught in Spring 2009. List the course_id, title, and 
-- section_id in order by section_id.

SELECT 1;

-- 2. (2 pts) For the spring 2009 semester, show the department name and number of students
-- enrolled in courses from each department. Label the number of students as "enrollment". 
-- Order the result by department name.

SELECT 1;

-- 3. (2 pts) List all instructor's ID , name and department with the number of courses taught
-- with the label "courses_taught". If an instructor did not teach, they are listed with a value of 
-- 0. Order by result by instructor_id.
-- A correct result will have 3 instructors with 0 courses.

SELECT 1;

-- 4. (2 pts) List the student majors (student.dept_name) and the number of students 
-- in each major with the label "students_in_major" in order by major.

SELECT 1;

-- 5. (2 pt) Same as #4 but only list majors with more than 2 students.

SELECT 1;

-- 6. (2 pts) List all departments and the number of students majoring in that department 
-- (use label "students_in_major") and have more than 90 total credits. Order by department 
-- name. Answer: 7 department rows. History, Music and Physics departments have 0 students

SELECT 1;

-- 7. (3 pts) Show the instructor ID, name, course title and number of times taught. 
-- Order the result by id, then title. If an instructor has not taught any courses then list
-- title as NULL and count as 0. Answer: Gold, Califeri and Singh have not taught courses.
-- (Hint: You will need to use two LEFT JOINs here.)

SELECT 1;

-- 8. (3 pts) List student id and name for students with more than 90 credits or have taken 
-- more than 2 courses. Order the result by student_id. Hint: Use UNION operator.
-- Answer: 6 rows

SELECT 1;

-- 9. (4 pts) Calculate the GPA for each student: Multiply the sum of numeric value of the grade times 
-- the course credits and divide by the sum of course credits for all courses taken. The numeric value 
-- of a grade can be found in the grade_points table. The course credit value is in the course table.
-- Label the GPA column as GPA and round to two significant digits.
-- To check your work: Zhang has a GPA 3.87, Snow has a NULL GPA
-- (Hint: You will to need use 3 LEFT JOINs here.)

SELECT 1;

-- 10. (3 pts) Find courses that have not been taken by any student. Return the course_id.
-- Answer: BIO-399 has not been taken by any students.

SELECT 1;