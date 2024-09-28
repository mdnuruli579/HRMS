-------POSITION TABLE------
CREATE TABLE TB_JOB_POSITION
(
id INT PRIMARY KEY IDENTITY (1,1),
title VARCHAR(20),
description VARCHAR(100),
min_salary INT DEFAULT 0,
max_salary INT DEFAULT 0,
created_at DATETIME,
updated_at DATETIME
)
-----PROJECTS------------
CREATE TABLE TB_PROJECTS
(
id INT PRIMARY KEY IDENTITY(1,1),
project_name VARCHAR(20),
start_date DATE,
end_date DATE,
status INT, --Ongoing, Completed--
created_at DATETIME,
updated_at DATETIME
);
-----------ROLE----------
CREATE TABLE TB_ROLE
 (
 role_id INT PRIMARY KEY IDENTITY(1,1),
role_name VARCHAR(20),
description VARCHAR(100),
created_at DATETIME,
updated_at DATETIME
 )
 ---------EMPLOYEE------
 CREATE TABLE TB_EMPLOYEE(
employee_id INT PRIMARY KEY IDENTITY (1,1),
first_name VARCHAR(20),
last_name VARCHAR(20),
date_of_birth DATE,
gender INT,
email VARCHAR(30) NOT NULL UNIQUE,
phone VARCHAR(10) NOT NULL UNIQUE,
address VARCHAR(100),
department_id INT FOREIGN KEY (department_id) REFERENCES TB_DEPARTMENT(department_id),
job_position_id INT FOREIGN KEY (job_position_id) REFERENCES TB_JOB_POSITION(id),
date_of_joining DATE,
employment_status INT,---(e.g., Full-time, Part-time, Contractor)---
supervisor_id INT FOREIGN KEY (supervisor_id) REFERENCES TB_EMPLOYEE,
created_at DATETIME,
updated_at DATETIME,
terminations_date DATE
)
--------DEPARTMENT-----
CREATE TABLE TB_DEPARTMENT
(
department_id INT PRIMARY KEY IDENTITY(1,1),
department_name VARCHAR(20),
manager_id INT,
created_at DATETIME,
updated_at DATETIME
)
ALTER TABLE TB_DEPARTMENT
ADD CONSTRAINT manager_id FOREIGN KEY (manager_id) REFERENCES TB_EMPLOYEE(employee_id)
----------ATTENDANCE------
CREATE TABLE TB_ATTANDANCE
(
attendance_id INT PRIMARY KEY IDENTITY(1,1),
employee_id INT FOREIGN KEY (employee_id) REFERENCES TB_EMPLOYEE (employee_id),
date DATE,
check_in_time TIME,
check_out_time TIME,
status INT,---(Present, Absent, Leave)---
created_at DATETIME,
updated_at DATETIME
)
-------LEAVE MANAGEMENT-----
CREATE TABLE TB_LEAVE_MANAGEMENT(
leave_id INT PRIMARY KEY IDENTITY(1,1),
employee_id INT FOREIGN KEY (employee_id) REFERENCES TB_EMPLOYEE (employee_id),
leave_type VARCHAR(20),
start_date DATETIME,
end_date DATETIME,
status INT, --Pending, Approve, Reject--
approved_by INT FOREIGN KEY (approved_by) REFERENCES TB_EMPLOYEE (employee_id),
created_at DATETIME,
updated_at DATETIME
)
-------PAYROLL------
CREATE TABLE TB_PAYROLL(
payroll_id INT PRIMARY KEY IDENTITY(1,1),
employee_id INT FOREIGN KEY (employee_id) REFERENCES TB_EMPLOYEE (employee_id),
salary_month INT NOT NULL,
basic_salary INT NOT NULL,
bonus INT DEFAULT 0,
deductions INT DEFAULT 0,
net_salary INT NOT NULL,
payment_date DATETIME NOT NULL,
created_at DATETIME NOT NULL,
updated_at DATETIME
)
-------PERFORMANCE EVALUATION----
CREATE TABLE TB_PERFOMANCE_EVALUATION(
evaluation_id INT PRIMARY KEY IDENTITY(1,1),
employee_id INT FOREIGN KEY (employee_id) REFERENCES TB_EMPLOYEE (employee_id),
evaluation_date DATE,
evaluator_id INT FOREIGN KEY (evaluator_id) REFERENCES TB_EMPLOYEE (employee_id),
performance_rating INT, ----(e.g., Excellent, Good, Needs Improvement)----
comments VARCHAR(50),
created_at DATETIME,
updated_at DATETIME,
)
-------TRANING AND DEVELOPMENT-------
CREATE TABLE TB_TRANING_AND_DEVELOPMENT(
training_id INT PRIMARY KEY IDENTITY(1,1),
employee_id INT FOREIGN KEY (employee_id) REFERENCES TB_EMPLOYEE (employee_id),
training_program VARCHAR(50) NOT NULL,
start_date DATE NOT NULL,
end_date DATE NOT NULL,
status INT NOT NULL,----(Completed, Ongoing, Not Started)-----
created_at DATETIME NOT NULL,
updated_at DATETIME
)
-------RECRUITMENT--------
CREATE TABLE TB_RECRUITMENT(
recruitment_id INT PRIMARY KEY IDENTITY(1,1),
job_position_id INT FOREIGN KEY (job_position_id) REFERENCES TB_JOB_POSITION(ID),
candidate_name VARCHAR(30) NOT NULL,
application_date DATETIME NOT NULL,
interview_date DATETIME,
status INT, -----(Shortlisted, Interviewed, Hired, Rejected)------
hired_employee_id INT FOREIGN KEY (hired_employee_id) REFERENCES TB_EMPLOYEE(employee_id),
created_at DATETIME NOT NULL,
updated_at DATETIME
)
-----------BENEFIT---------
CREATE TABLE TB_BENEFIT(
benefit_id INT PRIMARY KEY IDENTITY(1,1),
employee_id INT FOREIGN KEY (employee_id) REFERENCES TB_EMPLOYEE(employee_id),
benefit_type INT,---(Health, Retirement, etc.)-----
start_date DATE,
end_date DATE,
status INT DEFAULT 0,----(Active=1, Inactive=0)-----
created_at DATETIME NOT NULL,
updated_at DATETIME
)
-----EMPLOYEE PROJECT----
CREATE TABLE TB_EMPLOYEE_PROJECT(
employee_project_id INT PRIMARY KEY IDENTITY (1,1),
employee_id INT FOREIGN KEY (employee_id) REFERENCES TB_EMPLOYEE(employee_id),
project_id INT FOREIGN KEY (project_id) REFERENCES TB_PROJECTS(ID),
role_on_project INT,---(Developer, Manager, etc.)---
created_at DATETIME NOT NULL,
updated_at DATETIME
);
----EMPLOYEE ROLE----------
CREATE TABLE TB_EMPLOYEE_ROLE(
employee_role_id INT PRIMARY KEY IDENTITY(1,1),
employee_id INT FOREIGN KEY (employee_id) REFERENCES TB_EMPLOYEE(employee_id),
role_id INT FOREIGN KEY (role_id) REFERENCES TB_ROLE(role_id),
created_at DATETIME NOT NULL,
updated_at DATETIME
)
-------Manager----------
CREATE TABLE TB_MANAGER(
	manager_id int primary key identity(1,1),
	manager_name varchar(20),
	created_at datetime,
	updated_at datetime
)