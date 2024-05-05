use [bank loan db]
select * from bank_loan_data;

select count(id) as Total_Loan_Applications from bank_loan_data;

select count(id) as mtd_Total_Loan_Applications from bank_loan_data
where month (issue_date)=12 and year(issue_date)=2021;

select count(id) as pmtd_Total_Loan_Applications from bank_loan_data
where month (issue_date)=11 and year(issue_date)=2021;

select SUM(loan_amount) as total_funded_amount from bank_loan_data;

select SUM(loan_amount) as mtd_total_funded_amount from bank_loan_data
where month (issue_date)=12 and year(issue_date)=2021;


select SUM(loan_amount) as pmtd_total_funded_amount from bank_loan_data
where month (issue_date)=11 and year(issue_date)=2021;


select sum(total_payment)as total_amount_received from bank_loan_data;



select sum(total_payment)as mtd_total_amount_received from bank_loan_data
where month (issue_date)=12 and year(issue_date)=2021;



select sum(total_payment)as pmtd_total_amount_received from bank_loan_data
where month (issue_date)=11 and year(issue_date)=2021;

select round(AVG(int_rate)*100,2) as average_interest_rate from bank_loan_data;


select round(AVG(int_rate)*100,2) as mtd_average_interest_rate from bank_loan_data
where month (issue_date)=12 and year(issue_date)=2021;



select round(AVG(int_rate)*100,2) as pmtd_average_interest_rate from bank_loan_data
where month (issue_date)=11 and year(issue_date)=2021;


select ROUND(avg(dti)*100,2)as avg_dti from bank_loan_data;

select ROUND(avg(dti)*100,2)as mtd_avg_dti from bank_loan_data
where month (issue_date)=12 and year(issue_date)=2021;


select ROUND(avg(dti)*100,2)as pmtd_avg_dti from bank_loan_data
where month (issue_date)=11 and year(issue_date)=2021;

select sum(loan_amount)as good_loan_applications from bank_loan_data
where loan_status = 'Fully paid' or loan_status = 'Current';

select sum(total_payment)as good_loan_received from bank_loan_data
where loan_status = 'Fully paid' or loan_status = 'Current';


select count(id) as bad_loan_applications from bank_loan_data
where loan_status ='Charged off'


select sum(loan_amount) as bad_loan_funded from bank_loan_data
where loan_status ='Charged off'


select sum(total_payment) as loan_amount_received from bank_loan_data
where loan_status ='Charged off'

select count(case when loan_status = 'Charged off' then id end)*100.0 / count(id) as bad_loan_percentage from bank_loan_data;

SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status;

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status;


-- B - Bank loan report

SELECT 
	MONTH(issue_date) AS Month_Number, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY Count(id)desc

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term


SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY COUNT(id)desc

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose


SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership



SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY purpose
ORDER BY purpose










