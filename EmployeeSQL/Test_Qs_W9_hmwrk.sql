SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;

SELECT employees.emp_no, employees.last_name, employees.first_name, 
employees.sex, salaries.salary FROM salaries JOIN employees ON
employees.emp_no=salaries.emp_no LIMIT 10;

SELECT first_name, last_name, hire_date FROM employees WHERE
(SELECT EXTRACT(YEAR FROM hire_date)) = 1986 LIMIT 10;

