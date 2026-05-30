/*USE FintechProject;
GO*/

/*CREATE TABLE loans (
    loan_amnt FLOAT,
    term VARCHAR(20),
    int_rate FLOAT,
    installment FLOAT,
    grade VARCHAR(5),
    sub_grade VARCHAR(10),
    emp_length VARCHAR(20),
    home_ownership VARCHAR(20),
    annual_inc FLOAT,
    loan_status VARCHAR(50),
    purpose VARCHAR(50),
    addr_state VARCHAR(10),
    dti FLOAT,
    default_flag INT
);*/

/*DROP Table loans
GO*/
/*CREATE TABLE loans (
    loan_amnt FLOAT NULL,
    term VARCHAR(20) NULL,
    int_rate FLOAT NULL,
    installment FLOAT NULL,
    grade VARCHAR(5) NULL,
    sub_grade VARCHAR(10) NULL,
    emp_length VARCHAR(20) NULL,
    home_ownership VARCHAR(20) NULL,
    annual_inc FLOAT NULL,
    loan_status VARCHAR(50) NULL,
    purpose VARCHAR(50) NULL,
    addr_state VARCHAR(10) NULL,
    dti FLOAT NULL,
    default_flag INT NULL
);*/

/*Select TOP 10 *
from dbo.cleaned_loan_data */
/*DROP table Loans*/
/*EXEC sp_rename 'cleaned_loan_data', 'loans';*/

/*Select BOTTOM 10 * 
from loans*/

/*Total Loans
Select COUNT(*) as total_loans
from loans */

/* AVG Loan Amount
SELECT ROUND(AVG(loan_amnt),2) AS avg_loan
FROM loans;*/

/*Default rate
SELECT AVG(CAST(default_flag AS FLOAT)) * 100 AS default_rate
FROM loans;*/

/*Risk by Grade
SELECT grade,
       COUNT(*) AS total_loans,
       AVG(CAST(default_flag AS FLOAT))*100 AS default_rate
FROM loans
GROUP BY grade
ORDER BY default_rate DESC; */

/*State-wise Analysis
SELECT addr_state,
       COUNT(*) AS total_loans,
       AVG(loan_amnt) AS avg_loan
FROM loans
GROUP BY addr_state
ORDER BY total_loans DESC;*/

/*Loan Purpose Analysis
SELECT purpose,
       COUNT(*) AS total_loans,
       AVG(CAST(default_flag AS FLOAT))*100 AS default_rate
FROM loans
GROUP BY purpose
ORDER BY default_rate DESC;*/

/*STEP 8 — CASE WHEN Analysis
SELECT
    CASE
        WHEN annual_inc < 50000 THEN 'Low Income'
        WHEN annual_inc < 100000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_group,

    COUNT(*) AS customers,

    AVG(CAST(default_flag AS FLOAT))*100 AS default_rate

FROM loans

GROUP BY
    CASE
        WHEN annual_inc < 50000 THEN 'Low Income'
        WHEN annual_inc < 100000 THEN 'Medium Income'
        ELSE 'High Income'
    END;*/
/*STEP 9 — Window Functions
Rank Loans
SELECT loan_amnt,
       annual_inc,

       RANK() OVER(ORDER BY loan_amnt DESC) AS loan_rank

FROM loans;*/

/*Average Loan by Grade
SELECT grade,
       loan_amnt,

       AVG(loan_amnt) OVER(PARTITION BY grade) AS avg_grade_loan

FROM loans;*/

/*STEP 10 — Create Views (Looks Professional)
CREATE VIEW risk_analysis AS

SELECT grade,
       AVG(CAST(default_flag AS FLOAT))*100 AS default_rate
FROM loans
GROUP BY grade;*/




