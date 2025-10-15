create database Bank_analytics;

use Bank_analytics;

-- 1. Year-wise Loan Amount Stats

SELECT 
    SUBSTRING(issue_d, 5, 2) AS year, 
    SUM(loan_amnt) AS total_loan_amount 
FROM finance_1
GROUP BY SUBSTRING(issue_d, 5, 2)
ORDER BY year;

-- 2.  Grade and Sub-grade Wise Revolving Balance

SELECT 
    f1.grade, 
    f1.sub_grade, 
    SUM(f2.revol_bal) AS total_revolving_balance
FROM finance_1 f1
JOIN finance_2 f2 ON f1.id = f2.id
GROUP BY f1.grade, f1.sub_grade
ORDER BY f1.grade, f1.sub_grade;

-- 3.  Total Payment for Verified vs Non-Verified Status

SELECT 
    f1.verification_status, 
    SUM(f2.total_pymnt) AS total_payment_received
FROM finance_1 f1
JOIN finance_2 f2 ON f1.id = f2.id
GROUP BY f1.verification_status;

-- 4. State-wise and Month-wise Loan Status

SELECT 
    addr_state, 
    SUBSTRING(issue_d, 1, 3) AS month, 
    loan_status, 
    COUNT(*) AS count
FROM finance_1
GROUP BY addr_state, SUBSTRING(issue_d, 1, 3), loan_status
ORDER BY addr_state, month;

-- 5. Home Ownership vs Last Payment Date Stats

SELECT 
    f1.home_ownership, 
    AVG(f2.last_pymnt_amnt) AS avg_last_payment
FROM finance_1 f1
JOIN finance_2 f2 ON f1.id = f2.id
GROUP BY f1.home_ownership;




