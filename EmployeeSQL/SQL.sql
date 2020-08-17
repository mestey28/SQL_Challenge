-- Drop Tables if Existing
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;

--Create Departments Table
Create table departments(
	dept_no VARCHAR PRIMARY KEY NOT NULL,	
	dept_name VARCHAR NOT NULL
		);
		
--Create Department Employee table
Create table dept_emp(
	emp_no INT NOT NULL,	
	dept_no VARCHAR NOT NULL
		);	

--Titles Table
Create table titles(
	title_id VARCHAR PRIMARY KEY NOT NULL,	
	title VARCHAR NOT NULL
		);

--Employees Table
Create table employees(
	emp_no INT PRIMARY KEY NOT NULL,	
	emp_title_id VARCHAR NOT NULL,	
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,	
	last_name VARCHAR NOT NULL,	
	sex VARCHAR NOT NULL,	
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
	);	

--Dept Manager table
Create table dept_manager(
	dept_no VARCHAR NOT NULL,	
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
		);

--Salaries Table
Create table salaries(
	emp_no INT NOT NULL,	
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
		);

--check everything is set up first- before importing CSV
SELECT * FROM titles;

--Import CSV in this order
--departments, dept_emp, titles, employees, dept_manager, salaries
--Import all CSV's and double check





