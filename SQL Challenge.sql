-- Creating department table

CREATE TABLE Departments (
    dept_key SERIAL PRIMARY KEY,
    dept_no VARCHAR,
    dept_name VARCHAR
) 

select * from departments

-- Creating department employees table

CREATE TABLE dept_employees (
    emp_key SERIAL PRIMARY KEY,
    emp_no VARCHAR not null,
    dept_no VARCHAR not null
) 

-- updating dept employee columns
UPDATE dept_employees
SET emp_no = dept_no,
    dept_no = emp_no;

select * from dept_employees

-- Creating manager tables

CREATE TABLE managers (
    manager_key SERIAL PRIMARY KEY,
    emp_no VARCHAR not null,
    dept_no VARCHAR not null
) 

-- updating manager columns

UPDATE managers
SET emp_no = dept_no,
    dept_no = emp_no;
	
select * from managers

-- Creating employee table

CREATE TABLE employees (
    emp_no varchar PRIMARY KEY,
    emp_title VARCHAR not null,
    birth_date VARCHAR not null,
	first_name VARCHAR not null,
	last_name VARCHAR,
	sex varchar,
	hire_date varchar
)

select * from employees

-- Creating salaries table

CREATE TABLE salaries (
    salary_key SERIAL PRIMARY KEY,
    emp_no VARCHAR not null,
    salary int not null
)

select * from salaries

-- Creating title table

CREATE TABLE title (
    title_ID VARCHAR not null primary key,
    title VARCHAR not null
)

select * from title


-- List the employee number, last name, first name, sex, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE right(hire_date,4) >= '1986' AND right(hire_date,4) < '1987' order by hire_date desc

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT 
    e.emp_no,
    e.last_name,
    e.first_name,
    de.dept_no,
    d.dept_name
FROM 
    employees AS e
JOIN 
    dept_employees AS de ON e.emp_no = de.emp_no
JOIN 
    Departments AS d ON de.dept_no = d.dept_no;
	
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    de.dept_no,
    d.dept_name
FROM
    employees AS e
LEFT JOIN
    dept_employees AS de ON e.emp_no = de.emp_no
LEFT JOIN
    departments AS d ON de.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
	
SELECT
    first_name,
    last_name,
    sex
FROM
    employees
WHERE
    first_name = 'Hercules'
    AND last_name LIKE 'B%';
	
-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT
    e.emp_no,
    e.last_name,
    e.first_name
FROM
    employees AS e
JOIN
    dept_employees AS de ON e.emp_no = de.emp_no
JOIN
    Departments AS d ON de.dept_no = d.dept_no
WHERE
    d.dept_no = 'd007';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    employees AS e
JOIN
    dept_employees AS de ON e.emp_no = de.emp_no
JOIN
    Departments AS d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT
    last_name,
    COUNT(*) AS frequency
FROM
    employees
GROUP BY
    last_name
ORDER BY
    frequency DESC;