-- SQL homework 3 - Aggregation and Joins
-- 1.  Find the department(s)  with the most students. 
--     Return department name and the count of students labeled as "students" 
--     Your should find that Comp. Sci. has the most students with 4. (2 pts)
SELECT dept_name, count(student_id)
FROM student
GROUP BY dept_name
HAVING count(student_id) = max(count(student_id));

-- 2.  Find courses that have not been taken by any student Return the course_id.
--     Use NOT EXISTS or NOT IN predicate and a subquery.
--     Answer: BIO-399 has not been taken by any students. (2 pts)
SELECT 2;

-- 3.  Find the courses taken by students in the Comp. Sci. department
--     that have more than 90 credits.  
--     Return the course_id and title.  List each course only once. 
--     The answers will be CS-101 and CS-347 (3 pts)
SELECT 3;

-- 4.  Find students who passed a 4 credit course (course.credits=4)
--     A passing grade is A+, A, A-, B+, B, B-, C+, C, C-.
--     Return student ID and name ordered by student name.
--     The answer will have 8 students. (3 pts)
SELECT 4;

-- 5.  Find the course(s) taken by the most students.  Return columns 
--     course_id, title,  enrollment (the count of students that have taken the course)
--     The answer is CS-101 with an enrollment of 7 (4 pts)
SELECT 5;

-- 6.  create a view named "vcourse" showing columns course_id, title, credits, enrollment
--     If no students have taken the course, the enrollment should be 0. (4 pts)
CREATE VIEW vcourse AS SELECT 6;

-- 7.  List all the rows in the view "vcourse" and verify that
--     the enrollment in BIO-399 is 0. (2 pts)
SELECT 7;

-- 5. Use the view to display the course(s) with highest enrollment.
--    Return course_id, title, enrollment 
--    Answer is same as #6. (2 pts)
SELECT 8;
     
-- 9.  List the instructor(s) (ID, name) in order by ID who advise the most students
--      Answer:  Einstein, Katz and Kim  advise the most students. (3 pts)
SELECT 9;

-- 10. List the course_id and title for courses that are offered both in Fall 2009 and in Spring 2010.
--     A correct answers shows that CS-101 is the only course offered both semesters. (3pts)
SELECT 10;