DROP DATABASE IF EXISTS company_db;
CREATE DATABASE company_db;
USE company_db;


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    manager VARCHAR(100)
);
INSERT INTO departments VALUES
(1, 'HR', 'Sarah Johnson'),
(2, 'IT', 'David Miller'),
(3, 'Finance', 'Emily Clark');

INSERT INTO employees VALUES
(101, 'Alice', 'IT', 60000, '2021-06-15'),
(102, 'Bob', 'HR', 50000, '2020-09-23'),
(103, 'Charlie', 'Finance', 70000, '2019-02-10'),
(104, 'Diana', 'IT', 75000, '2022-01-05'),
(105, 'Eve', 'HR', 55000, '2021-11-30');
-- View all employees
SELECT * FROM employees;

-- IT Department employees
SELECT name FROM employees WHERE department = 'IT';

-- Average salary by department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- Join employees with departments
SELECT e.name, e.department, d.manager
FROM employees e
JOIN departments d ON e.department = d.dept_name;

-- Update salary
UPDATE employees SET salary = 80000 WHERE emp_id = 104;

-- Delete employee
DELETE FROM employees WHERE emp_id = 105;
