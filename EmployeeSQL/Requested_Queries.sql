-- Check all table imports

SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

-- List the employee number, last name, first name, sex, and salary 
-- of each employee.

SELECT 	employees.emp_no, 
		employees.last_name, 
		employees.first_name, 
		employees.sex, salaries.salary 
FROM salaries 
JOIN employees ON employees.emp_no=salaries.emp_no
ORDER BY employees.last_name;

-- List the first name, last name, and hire date for the employees 
-- who were hired in 1986.

SELECT 	first_name, 
		last_name, 
		hire_date 
FROM employees 
WHERE (SELECT EXTRACT(YEAR FROM hire_date)) = 1986
ORDER BY hire_date;

-- List the manager of each department along with their 
-- department number, department name, employee number, last name, 
-- and first name.

SELECT 	dept_manager.dept_no, 
		departments.dept_name, 
		dept_manager.emp_no,
		employees.last_name,
		employees.first_name
FROM dept_manager 
LEFT JOIN departments ON dept_manager.dept_no=departments.dept_no 
LEFT JOIN employees ON dept_manager.emp_no=employees.emp_no
ORDER BY dept_manager.dept_no;

-- List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department 
-- name.

SELECT 	departments.dept_no,
		employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no
ORDER BY departments.dept_no, employees.emp_no;

-- List first name, last name, and sex of each employee 
-- whose first name is Hercules and whose last name begins 
-- with the letter B.

SELECT 	first_name,
		last_name,
		sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;

-- List each employee in the Sales department, including 
-- their employee number, last name, and first name.

SELECT  emp_no,
		last_name,
		first_name
FROM employees 
WHERE emp_no IN (
	SELECT emp_no FROM dept_emp 
	WHERE dept_no IN (
		SELECT dept_no FROM departments
		WHERE dept_name = 'Sales'
	)
)
ORDER BY emp_no;

-- List each employee in the Sales and Development 
-- departments, including their employee number, last 
-- name, first name, and department name.

SELECT 	employees.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name
FROM employees
JOIN dept_emp ON employees.emp_no=dept_emp.emp_no
JOIN departments ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name = 'Sales' OR
departments.dept_name = 'Development'
ORDER BY emp_no;

-- List the frequency counts, in descending order, of 
-- all the employee last names (that is, how many employees 
-- share each last name).

SELECT last_name, COUNT(last_name) AS last_name_count 
FROM employees 
GROUP BY last_name
ORDER BY last_name_count DESC;
