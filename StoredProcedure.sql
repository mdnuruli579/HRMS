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
