-- queries for hw 
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

select e.emp_no as "Employee Number",
e.last_name as "Last Name",
e.first_name as "First Name",
e.gender as "Gender",
s.salary as "Salary"
from employees as e
inner join salaries as s
on e.emp_no = s.emp_no;

-- 2. list employees who were hired in 1987.
select * from employees;

select emp_no as "Employee Number",
first_name as "First Name",
last_name as "Last Name",
hire_date as "Hire Date"
from employees
where substring (hire_date,1,4) = '1987';

-- 3. List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name, and start and end employment dates.
select * from dept_manager;
select * from employees;
select * from departments;

select d.dept_no as "Department Number",
d.dept_name as "Department Name",
e.emp_no as "Employee Number",
e.last_name as "Last Name",
e.first_name as "First Name",
m.from_date as "Start Date",
m.to_date as "Last Day"
from departments as d
inner join dept_manager as m
on d.dept_no= m.dept_no
inner join employees as e
on e.emp_no = m.emp_no
order by d.dept_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
select * from employees;
select * from departments;
select * from dept_emp;

select e.emp_no as "Employee Number",
e.last_name as "Last Name",
e.first_name as "First Name",
d.dept_name as "Department Name"
from departments as d
inner join dept_emp as de
on d.dept_no = de.dept_no
inner join employees as e
on e.emp_no = de.emp_no
order by e.emp_no;

-- 5. List all employees whose first name is "Duangkaew" and last names begin with "P."
select * from employees;

select * 
from employees 
where (first_name = 'Duangkaew') and substring(last_name,1,1) = 'P'
order by last_name;

-- 6. List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.
select * from departments;
select * from employees;
select * from dept_emp;

select e.emp_no as "Employee Number",
e.last_name as "Last Name",
e.first_name as "First Name",
d.dept_name as "Department Name"
from dept_emp as de
inner join departments as d
on d.dept_no = de.dept_no
inner join employees as e
on e.emp_no = de.emp_no
where de.dept_no = 'd007'
order by e.emp_no;

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

select e.emp_no as "Employee Number",
e.last_name as "Last Name",
e.first_name as "First Name",
d.dept_name as "Department Name"
from dept_emp as de
inner join departments as d
on d.dept_no = de.dept_no
inner join employees as e
on e.emp_no = de.emp_no
where (de.dept_no = 'd007') or (de.dept_no = 'd005')
order by e.emp_no;

-- 8. In ascending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select last_name as "Last Names", count(last_name) as "Count"
from employees
group by last_name
order by count(last_name) asc;