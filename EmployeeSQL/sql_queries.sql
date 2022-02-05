-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.sex, 
	salaries.salary
FROM employees
INNER JOIN salaries ON 
	employees.emp_no = salaries.emp_no
	
ORDER BY emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
-- (https://popsql.com/learn-sql/postgresql/how-to-query-date-and-time-in-postgresql)

SELECT employees.first_name,
	employees.last_name,
	employees.hire_date
FROM employees
WHERE DATE_PART('year', hire_date) = '1986'

ORDER BY hire_date;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dept_manager.dept_no,
	departments.dept_name,
	dept_manager.emp_no,
	employees.last_name,
	employees.first_name
FROM dept_manager
INNER JOIN departments ON
	dept_manager.dept_no = departments.departments
INNER JOIN employees ON
	dept_manager.emp_no = employees.emp_no
	
ORDER BY dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp ON 
	employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
	dept_emp.dept_no = departments.departments
	
ORDER BY employees.emp_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT employees.first_name,
	employees.last_name,
	employees.sex
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp ON 
	employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
	dept_emp.dept_no = departments.departments
WHERE departments.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
INNER JOIN dept_emp ON 
	employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
	dept_emp.dept_no = departments.departments
WHERE departments.dept_name LIKE 'Sales' 
	OR departments.dept_name LIKE 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-- (https://stackoverflow.com/questions/28752414/counts-of-unique-values-in-postgres-group-by)

SELECT employees.last_name, 
	COUNT(employees.last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(employees.last_name) DESC;