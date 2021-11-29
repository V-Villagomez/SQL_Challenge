-- Drop table if exists
DROP TABLE IF EXISTS titles;
-- Create the titles table, with a primary id and a title
CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);

-- Drop table if exists
DROP TABLE IF EXISTS employees;
-- Create an employees table, with the following: 
-- set the foreign key and primary key relationships accordingly
CREATE TABLE employees (
	 emp_no INT PRIMARY KEY,
	 emp_title_id VARCHAR,
	 --FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	 birth_date DATE,
	 first_name VARCHAR,
	 last_name VARCHAR,
	 sex VARCHAR,
	 hire_date DATE
	 --md5(concat(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date))
);

-- Drop table if exists
DROP TABLE IF EXISTS departments;
-- Create an departments table, with the following: 
-- set the primary key relationships accordingly
CREATE TABLE departments (
	dept_no	VARCHAR PRIMARY KEY, 
	dept_name VARCHAR
);

-- Drop table if exists
DROP TABLE IF EXISTS dept_managers;
-- Create an dept_manager table, with the following: 
-- set the foreign key and primary key relationships accordingly
CREATE TABLE dept_managers (
	dept_no VARCHAR, 
	--FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT 
	--FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Drop table if exists
DROP TABLE IF EXISTS dept_emp;
-- Create an dept_emp table, with the following: 
-- set the foreign key and primary key relationships accordingly
CREATE TABLE dept_emp (
	dept_no VARCHAR, 
	--FOREIGN KEY (dept_no) REFERENCES departments(dept_no), 
	emp_no INT 
	--FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Drop table if exists
DROP TABLE IF EXISTS salaries;
-- Create an salaries table, with the following: 
-- set the foreign key and primary key relationships accordingly
CREATE TABLE salaries (
	salary INT,
	emp_no INT 
	--FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create alter tables to set foreign key relationships accordingly
ALTER TABLE employees
ADD FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);

ALTER TABLE dept_managers
ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
	
ALTER TABLE dept_managers
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_emp
ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_emp 
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE salaries
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);