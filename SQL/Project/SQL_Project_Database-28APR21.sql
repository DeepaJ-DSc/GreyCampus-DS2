-- Create Students table

CREATE TABLE students (
student_id SERIAL PRIMARY KEY, 
first_name varchar (75) NOT NULL,
last_name varchar (75) NOT NULL, 
homeroom_number INTEGER, 
phone INTEGER UNIQUE NOT NULL,
email varchar (250) UNIQUE NOT NULL,
graduation_year INTEGER
);

-- Create Teachers table

CREATE TABLE teachers (
teacher_id SERIAL PRIMARY KEY, 
first_name varchar (75) NOT NULL,
last_name varchar (75) NOT NULL, 
homeroom_number INTEGER, 
department varchar (75),
email varchar (250) UNIQUE NOT NULL,
phone INTEGER UNIQUE NOT NULL
);

-- Insert data into students table

INSERT INTO students (student_id, first_name, last_name, homeroom_number, 
					  phone, graduation_year)
VALUES (1, 'Mark', 'Watney', 5, 777-555-1234, 2035);

-- ERROR:  null value in column "email" of relation "students" violates not-null constraint

INSERT INTO students (student_id, first_name, last_name, homeroom_number, 
					  phone, email, graduation_year)
VALUES (1, 'Mark', 'Watney', 5, 777-555-1234, 'mark.w@school.com', 2035);

INSERT INTO students (student_id, first_name, last_name, phone, email)
VALUES (2, 'Deepa', 'Jan', 777-888-3456, 'deepa.j@school.com');

SELECT * FROM students;

ALTER TABLE students
ALTER COLUMN phone TYPE varchar (50);

UPDATE students
SET phone = '777-555-1234'
WHERE student_id = 1;

UPDATE students
SET phone = '777-888-3456'
WHERE student_id = 2;

SELECT * FROM students;

ALTER TABLE teachers
ALTER COLUMN phone TYPE varchar (50);

SELECT * FROM teachers;

-- Insert data into teachers table

INSERT INTO teachers (teacher_id, first_name, last_name, homeroom_number, department,
					  email, phone)
VALUES (1, 'Jonas', 'Salk', 5, 'BIOLOGY', 'jsalk@school.org', '777-555-4321');

INSERT INTO teachers (teacher_id, first_name, last_name, phone)
VALUES (2, 'Peter', 'West', '777-555-4321');

-- ERROR:  null value in column "email" of relation "teachers" violates not-null constraint
-- DETAIL:  Failing row contains (2, Peter, West, null, null, null, 777-555-4321).

INSERT INTO teachers (teacher_id, first_name, last_name, email, phone)
VALUES (2, 'Peter', 'West', 'pwest@school.org', '777-555-4328');

SELECT * FROM teachers;













