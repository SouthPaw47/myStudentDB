CREATE DATABASE student_db;


USE student_db;


CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    age INT
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    grade VARCHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


INSERT INTO students (student_id, student_name, age) VALUES
    (1, 'Alice', 20),
    (2, 'Bob Johnson', 22),
    (3, 'Charlie', 19);

INSERT INTO courses (course_id, course_name) VALUES
    (1, 'Mathematics'),
    (2, 'Physics'),
    (3, 'History');

INSERT INTO enrollments (enrollment_id, student_id, course_id, grade) VALUES
    (1, 1, 1, 'A'),
    (2, 2, 1, 'C'),
    (3, 3, 2, 'B');