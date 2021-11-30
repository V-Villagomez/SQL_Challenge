-- Drop table if exists
DROP TABLE IF EXISTS titles CASCADE;
-- Create the titles table, with a primary id and a title
CREATE TABLE titles (
	title_id VARCHAR,
	title VARCHAR,
	CONSTRAINT pk_titles PRIMARY KEY (title_id)
); 

-- Drop table if exists
DROP TABLE IF EXISTS employees CASCADE;
-- Create an employees table, with the following: 
-- set the foreign key and primary key relationships accordingly
CREATE TABLE employees (
	 emp_no INT,
	 emp_title_id VARCHAR,
	 birth_date DATE,
	 first_name VARCHAR,
	 last_name VARCHAR,
	 sex VARCHAR,
	 hire_date DATE,
	 FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	 CONSTRAINT pk_employees PRIMARY KEY (emp_no)
	 --md5(concat(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date))
);

-- Drop table if exists
DROP TABLE IF EXISTS departments CASCADE;
-- Create an departments table, with the following: 
-- set the primary key relationships accordingly
CREATE TABLE departments (
	dept_no	VARCHAR, 
	dept_name VARCHAR,
	CONSTRAINT pk_departments PRIMARY KEY (dept_no)
);

-- Drop table if exists
DROP TABLE IF EXISTS dept_managers;
-- Create an dept_manager table, with the following: 
-- set the foreign key and primary key relationships accordingly
CREATE TABLE dept_managers (
	dept_no VARCHAR, 
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Drop table if exists
DROP TABLE IF EXISTS dept_emp;
-- Create an dept_emp table, with the following: 
-- set the foreign key and primary key relationships accordingly
CREATE TABLE dept_emp (
	dept_no VARCHAR,
	emp_no INT,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Drop table if exists
DROP TABLE IF EXISTS salaries;
-- Create an salaries table, with the following: 
-- set the foreign key and primary key relationships accordingly
CREATE TABLE salaries (
	salary INT,
	emp_no INT, 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

