-- CREATE A TABLE ACCOUNT TO STORE USER INFORMATION.
CREATE TABLE account(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) UNIQUE NOT NULL,
	password VARCHAR(50) NOT NULL,
	email VARCHAR(250) UNIQUE NOT NULL,
	created_on TIMESTAMP NOT NULL,
	last_login TIMESTAMP
);

-- CREATE JOB TABLE
CREATE TABLE job(
	job_id SERIAL PRIMARY KEY,
	job_title VARCHAR(100) UNIQUE NOT NULL
)

-- CREATE TABLE EMP_SAL
CREATE TABLE emp_sal(
	user_id INTEGER REFERENCES account (user_id),
	job_id INTEGER REFERENCES job (job_id),
	salary BIGINT NOT NULL,
	hire_date TIMESTAMP
)

-- INSERT VALUES INTO ACCOUNT TABLE
INSERT INTO account (username,password,email,created_on)
VALUES
('Deepa', 'abc123', 'deepa@abc.com', CURRENT_TIMESTAMP)

INSERT INTO account (username,password,email,created_on)
VALUES
('Jim', 'pwd', 'jim@abc.com', CURRENT_TIMESTAMP)

-- INSERT VALUES INTO JOB TABLE
INSERT INTO job (job_title)
VALUES
('Data Scientist');

INSERT INTO job (job_title)
VALUES
('Data Analyst');

-- INSERT VALUES INTO EMPSAL REFERENCING ACCOUNT AND JOB TABLES
INSERT INTO emp_sal (user_id,job_id,hire_date)
VALUES
(1, 1, CURRENT_TIMESTAMP);

SELECT * FROM account;
SELECT * FROM job;
SELECT * FROM emp_sal;

--UPDATE SALARY IN EMPSAL TABLE
UPDATE emp_sal
SET salary = 50000;

UPDATE emp_sal
SET salary = 75000;


-- QUERY JOINING THE TABLES
SELECT username, job_title, salary
FROM account
INNER JOIN emp_sal
ON account.user_id = emp_sal.user_id
INNER JOIN job
ON job.job_id = emp_sal.job_id;

-- ALTER TABLE
SELECT * FROM account;

--ADD NEW COLUMN
ALTER TABLE account
ADD address VARCHAR (300);

--DROP EXISTING COLUMN
ALTER TABLE account
DROP COLUMN address;

--RENAME EXISTING COLUMN
ALTER TABLE account
RENAME COLUMN address TO adres;


SELECT * FROM emp_sal



-- alter character length
ALTER TABLE account
ALTER COLUMN adres TYPE character varying (500);

SELECT * FROM account

SELECT * FROM emp_sal







