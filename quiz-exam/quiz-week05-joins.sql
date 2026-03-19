
SELECT max(salary)
FROM instructor;


SELECT dept_name, count(instructor_id)
FROM instructor
GROUP BY dept_name;


SELECT count(DISTINCT dept_name)
FROM instructor;


SELECT course_id, section_id, semester, count(student_id)
FROM takes
WHERE section_year = 2010
GROUP BY course_id, section_id, semester
HAVING count(student_id) >= 1;

select distinct section_year from takes;


SELECT DISTINCT t.course_id, i.instructor_name
FROM instructor i
JOIN teaches t ON i.instructor_id = t.instructor_id
-- WHERE i.instructor_name = 'Albert Einstein';


SELECT s.student_name, count(t.section_id)
FROM student s
JOIN takes t ON s.student_id = t.student_id
GROUP BY s.student_id;


SELECT i.instructor_name, count(DISTINCT t.section_id)
FROM instructor i
LEFT JOIN teaches t ON i.instructor_id = t.instructor_id
GROUP BY i.instructor_id;



