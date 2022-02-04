DROP TABLE employees;

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR (10) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	sex VARCHAR (5) NOT NULL,
	hire_date DATE NOT NULL
);

SELECT * FROM employees;

ALTER TABLE public.employees DROP CONSTRAINT employees_pkey;
ALTER TABLE public.employees
	ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_no);
ALTER TABLE public.employees
	ADD CONSTRAINT titles_to_emp FOREIGN KEY (emp_title_id)
	REFERENCES public.titles (title_id);
-------------------------
DROP TABLE salaries;

CREATE TABLE salaries (
	emp_no INT,
	salary INT
);

SELECT * FROM salaries;

ALTER TABLE public.salaries
	ADD CONSTRAINT emp_to_salaries FOREIGN KEY (emp_no)
	REFERENCES public.employees (emp_no);
-------------------------
DROP TABLE titles;

CREATE TABLE titles (
	title_id VARCHAR (10) PRIMARY KEY,
	title VARCHAR 
);

SELECT * FROM titles;

ALTER TABLE public.titles DROP CONSTRAINT titles_pkey;
ALTER TABLE public.titles
	ADD CONSTRAINT titles_pkey PRIMARY KEY (title_id);
-------------------------
DROP TABLE departments;

CREATE TABLE departments (
	departments VARCHAR (10) PRIMARY KEY,
	dept_name VARCHAR (100) NOT NULL
);

SELECT * FROM departments;

ALTER TABLE public.departments DROP CONSTRAINT departments_pkey;
ALTER TABLE public.departments
	ADD CONSTRAINT departments_pkey PRIMARY KEY (departments);
-------------------------
DROP TABLE dept_manager;

CREATE TABLE dept_manager (
	dept_no VARCHAR (10) NOT NULL,
	emp_no INT NOT NULL
);

SELECT * FROM dept_manager;

ALTER TABLE public.dept_manager
	ADD CONSTRAINT dept_to_manager FOREIGN KEY (dept_no)
	REFERENCES public.departments (departments);
ALTER TABLE public.dept_manager
	ADD CONSTRAINT emp_to_manager FOREIGN KEY (emp_no)
	REFERENCES public.employees (emp_no);
-------------------------
DROP TABLE dept_emp;

CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL
);

SELECT * FROM dept_emp;

ALTER TABLE public.dept_emp
	ADD CONSTRAINT dept_to_deptemp FOREIGN KEY (dept_no)
	REFERENCES public.departments (departments);
ALTER TABLE public.dept_emp
	ADD CONSTRAINT emp_to_deptemp FOREIGN KEY (emp_no)
	REFERENCES public.employees (emp_no);
-------------------------
