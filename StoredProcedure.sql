-----EMPLOYEE OVERVIEW DASHBOARD------
CREATE PROC SPEMPLOYEE_OVERVIEW
AS
BEGIN

SELECT 
    (SELECT COUNT(*) FROM TB_EMPLOYEE) AS total_employees,
    (SELECT COUNT(*) 
     FROM TB_EMPLOYEE 
     WHERE MONTH(date_of_joining) = MONTH(GETDATE())
     AND YEAR(date_of_joining) = YEAR(GETDATE())) AS joined_this_month,
    (SELECT COUNT(*) 
     FROM TB_EMPLOYEE 
     WHERE terminations_date IS NOT NULL
     AND MONTH(terminations_date) = MONTH(GETDATE())
     AND YEAR(terminations_date) = YEAR(GETDATE())) AS terminated_this_month;

END

------------INSERT EMPLOYEE----------
CREATE PROC SP_INSERT_EMP
@first_name VARCHAR(20),
@last_name VARCHAR(20),
@date_of_birth DATE,
@gender INT,
@email VARCHAR(30),
@phone VARCHAR(10),
@address VARCHAR(100),
@department_id INT ,
@job_position_id INT ,
@date_of_joining DATE,
@employment_status INT,
@supervisor_id INT
AS
BEGIN
INSERT INTO TB_EMPLOYEE(first_name,last_name,date_of_birth,gender,email,phone,address,department_id,job_position_id,date_of_joining,employment_status,supervisor_id,created_at)
VALUES(@first_name,@last_name,@date_of_birth,@gender,@email,@phone,@address,@department_id,@job_position_id,@date_of_joining,@employment_status,@supervisor_id,GETDATE());
END
--------------GET EMPLOYEE----------
CREATE PROC SP_GET_EMPLOYEE
AS
BEGIN
SELECT e.employee_id, e.first_name, e.last_name,e.date_of_birth,
e.gender,e.email,e.phone,e.address,e.date_of_joining,e.employment_status,e.supervisor_id,
e.created_at,d.department_id,d.department_name,j.id as job_pos_id, j.title 
FROM TB_EMPLOYEE e
JOIN TB_DEPARTMENT d ON e.department_id = d.department_id
JOIN TB_JOB_POSITION j ON e.job_position_id = j.id;
END
