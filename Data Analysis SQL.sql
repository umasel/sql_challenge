--DATA ANALYSIS --------------------------------------------------------
--1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT  employees.emp_no,
		employees.last_name,
		employees.first_name,
		employees.sex,
		salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;
--employees and salaries tables share the emp_no column

--FROM salaries AS s
--INNER JOIN employees as e ON e.emp_no = s.emp_no;
--Giving an 'invalid reference to FROM-clause entry for table "employees"' message when trying to use aliases


--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE hire_date > '1985-12-31'
AND hire_date < '1987-01-01';
--dates are selected to reflect any employee in 1986 or between 31-December 1985 and 1 January 1987.


--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dept_manager.dept_no, 
	   departments.dept_name,
	   dept_manager.emp_no,
	   employees.last_name,
	   employees.first_name
FROM dept_manager
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no
--departments and dept-manager tables share the dept_no column
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no;
--dept_manager and employees tables share the emp_no column


--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT departments.dept_no,
	   employees.emp_no, 
	   employees.last_name, 
	   employees.first_name,
	   departments.dept_name
FROM employees
INNER JOIN dept_manager ON
employees.emp_no = dept_manager.emp_no
--employees and dept_manager tables share the emp_no column
INNER JOIN Departments ON
dept_manager.dept_no = departments.dept_no;
--dept_manager and departments tables share the dept_no column


--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT * FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';


--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT  employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM departments
INNER JOIN dept_emp ON
	dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON
	dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales';
--WHERE used to filter dept_name by employees in the Sales department


--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT  employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM departments
INNER JOIN dept_emp ON
	dept_emp.dept_no = departments.dept_no
INNER JOIN employees ON
	dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';
--same as query above, but includes those in the Development department


--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT  last_name,
		COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
