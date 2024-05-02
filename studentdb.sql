CREATE DATABASE IF NOT EXISTS student_db;


USE student_db;

CREATE TABLE IF NOT EXISTS Students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT
);

CREATE TABLE IF NOT EXISTS Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    teacher VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Enrollments (
    student_id INT,
    course_id INT,
    semester VARCHAR(50),
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students (first_name, last_name, age) VALUES
    ('Alice', 'Smith', 22),
    ('Bob', 'Johnson', 21),
    ('Carol', 'Williams', 23),
    ('David', 'Jones', 24);

INSERT INTO Courses (course_name, teacher) VALUES
    ('Mathematics', 'Dr. Alan'),
    ('English', 'Prof. Elizabeth'),
    ('Science', 'Dr. Brown'),
    ('History', 'Prof. Charles');

INSERT INTO Enrollments (student_id, course_id, semester, grade) VALUES
    (1, 1, 'Fall 2024', 'A'),
    (1, 2, 'Fall 2024', 'B'),
    (2, 1, 'Fall 2024', 'C'),
    (3, 4, 'Spring 2025', 'B'),
    (4, 3, 'Spring 2025', 'A');

SELECT s.first_name, s.last_name
FROM Students s
JOIN Enrollments e ON s.id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Mathematics';

UPDATE Enrollments
SET grade = 'A-'
WHERE student_id = 2 AND course_id = 1;


DELETE FROM Students
WHERE age < 21;
