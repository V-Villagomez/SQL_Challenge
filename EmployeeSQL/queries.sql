-- Select the employee number, last name, first name, sex, and salary of all employees, ordered by employee number
SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	e.sex As "Gender",
	s.salary AS "Salary"
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- Select the first name, last name, and hiring date for all employees hired in 1986 
SELECT
	e.first_name AS "First Name",
	e.last_name AS "Last Name",
	e.hire_date AS "Hire Date"
FROM employees e
WHERE EXTRACT(year FROM e.hire_date) = 1986;

-- Select the department number, department name, employee number, last name, and first name of all managers of each department
SELECT 
	dm.dept_no AS "Department Number",
	d.dept_name AS "Department Name",
	dm.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name"
FROM dept_managers dm
INNER JOIN departments d ON dm.dept_no = d.dept_no
INNER JOIN employees e ON dm.emp_no = e.emp_no;

-- Select the employee number, last name, first name, and department of each employee, ordered by employee number
SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
FROM employees e
LEFT JOIN dept_emp de ON e.emp_no = de.emp_no
LEFT JOIN departments d ON de.dept_no = d.dept_no
ORDER BY e.emp_no;

-- Select first name, last name, birth date, and sex of all employees whose first name is "Hercules" and last name begins with a "B"
SELECT 
	e.first_name AS "First Name",
	e.last_name AS "Last Name",
	e.birth_date AS "Date of Birth",
	e.sex AS "Gender"
FROM employees e
WHERE e.first_name = 'Hercules'
AND e.last_name LIKE 'B%';

-- Select employee number, last name, first name, and department name of all employees in the Sales department, ordered by employee number
SELECT 
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;

-- Select employee number, last name, first name, and department name of all employees in the 'Sales' OR the 'Development' department, ordered by employee number
SELECT
	e.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;
	
-- Count the number of employees, grouped by last name
SELECT 
	e.last_name AS "Last Name",
	COUNT(e.last_name) AS "Number of Employees"
FROM employees e
GROUP BY e.last_name
ORDER BY COUNT(e.last_name) DESC;
