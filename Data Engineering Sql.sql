CREATE TABLE departments (
	dept_no varchar(255) NOT NULL PRIMARY KEY,
	dept_name varchar(255) NOT NULL
);

CREATE TABLE titles (
title_id varchar(255) NOT NULL PRIMARY KEY,
title varchar(255) NOT NULL
);

CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title varchar(255) NOT NULL,
	birth_date DATE NOT NULL,
	first_name varchar(255) NOT NULL,
	last_name varchar(255) NOT NULL,
	sex varchar(255),
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL ,
	dept_no varchar(255) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no varchar(255) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);