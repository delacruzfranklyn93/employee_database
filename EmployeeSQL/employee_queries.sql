-- Use select to check the tables being used (1-2)
SELECT * FROM "Employees";
SELECT * FROM "Salaries";

--QUESTION 1

--Using joins to get employee information
SELECT e.emp_no, e.last_name, e.first_name,e.sex, s.salary
FROM "Employees" e
JOIN "Salaries" s
ON e.emp_no = s.emp_no;

-- QUESTION 2

-- Query the first and last name of employees hired in 1986
SELECT first_name, last_name, hire_date FROM "Employees"
WHERE DATE_PART('year', hire_date) = 1986;

--QUESTION 3

-- Use select to check the tables you will be using for query
SELECT * FROM "Dept_Manager";
SELECT * FROM "Departments";
SELECT * FROM "Employees";


-- Query the managers of each department as well as the department and manager information
SELECT d.dept_no,
(SELECT "Departments".dept_name
 	FROM "Departments"
 	WHERE "Departments".dept_no = d.dept_no),
	d.emp_no,e.last_name, e.first_name
FROM "Dept_Manager" d
JOIN "Employees" e 
ON d.emp_no = e.emp_no;

-- QUESTION 4
-- Use select to check the tables you will be using for query
SELECT * FROM "Dept_Emp"
SELECT * FROM "Employees";
SELECT * FROM "Departments";

-- Query the employees information as well as department they work for 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" e
Join "Dept_Emp" de
ON e.emp_no = de.emp_no
JOIN "Departments" d
ON de.dept_no = d.dept_no;

-- QUESTION 5

-- Query employees with first name "Hercules" and last name start with B
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'

-- QUESTION 6 

-- Query employees from the sales department
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" e
Join "Dept_Emp" de
ON e.emp_no = de.emp_no
JOIN "Departments" d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'

-- QUESTION 7

-- Query employees from the sales and Development department
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM "Employees" e
Join "Dept_Emp" de
ON e.emp_no = de.emp_no
JOIN "Departments" d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'

-- QUESTION 8

-- Query frequency count of employee last names
SELECT last_name, COUNT(last_name)
FROM "Employees"
GROUP BY last_name
ORDER BY count DESC






