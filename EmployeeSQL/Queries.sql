--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
Join salaries ON
employees.emp_no=salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date IN
	(
	SELECT hire_date
	from employees
	where hire_date BETWEEN '1986-01-01' and '1987-01-01'
	);


-- select * from departments;

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager ON
departments.dept_no= dept_manager.dept_no
JOIN employees ON
dept_manager.emp_no=employees.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
join dept_emp on
dept_emp.emp_no=employees.emp_no
join departments on
dept_emp.dept_no=departments.dept_no;


--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
from employees
where first_name= 'Hercules' AND last_name LIKE 'B%';


--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.first_name, employees.last_name, dept_emp.emp_no, departments.dept_name
from dept_emp
join employees on
dept_emp.emp_no=employees.emp_no
join departments
on dept_emp.dept_no= departments.dept_no
where departments.dept_name= 'Sales';


--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.first_name, employees.last_name, dept_emp.emp_no, departments.dept_name
from dept_emp
join employees on
dept_emp.emp_no=employees.emp_no
join departments
on dept_emp.dept_no= departments.dept_no
where departments.dept_name= 'Sales' or departments.dept_name= 'Development';


--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT employees.last_name, COUNT(employees.last_name) as frequency
from employees
group by last_name
order by 
count (last_name) DESC;



