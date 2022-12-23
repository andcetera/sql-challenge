DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY
    emp_title_id VARCHAR FOREIGN KEY --?
    birth_date DATE
    first_name VARCHAR
    last_name VARCHAR
    sex VARCHAR
    hire_date DATE
);

CREATE TABLE departments (
    dept_no VARCHAR PRIMARY KEY --maybe?
    dept_name VARCHAR
);

CREATE TABLE dept_emp (
    emp_no INT FOREIGN KEY      --?
    dept_no VARCHAR FOREIGN KEY --?
);

CREATE TABLE dept_manager (
    dept_no VARCHAR FOREIGN KEY --?
    emp_no INT FOREIGN KEY      --?
);

CREATE TABLE salaries (
    emp_no INT FOREIGN KEY --?
    salary INT
);

CREATE TABLE titles (
    title_id VARCHAR PRIMARY KEY --connected to emp_title_id from employees...?
    title VARCHAR
);