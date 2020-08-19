use join_example_db;

SELECT *
FROM users, roles;

# Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

# Inner join
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

# Left join
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

# Right join
SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

# Write a query that shows each department along with the name of the current manager for that department.
# departments table to get the department name
# dept_manger table to get the emp_no and dept_no of manager
# employees
use employees;
SELECT dept_name as "Department Name", concat(first_name, ' ', last_name) as "Department Manager"
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no;

# Find the name of all departments currently managed by women.
# departments table to get department name
# department name | manager name
# development     | leon dassarma
#dept_manager
# employees table to get names from emp_no
SELECT dept_name as "Department Name", concat(first_name, ' ', last_name) as "Department Manager"
FROM departments
JOIN dept_manager ON dept_manager.dept_no = departments.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE dept_manager.to_date > curdate()
AND gender = 'F'
ORDER BY dept_name;

# Find current titles of employees currently working in the customer service department.
# output is title and count
# list our tables: titles table for titles, departments, dept_emp
SELECT title, count(title)
FROM titles
JOIN dept_emp ON dept_emp.emp_no = titles.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.to_date > curdate()
AND titles.to_date > curdate()
AND departments.dept_name = 'Customer Service'
GROUP BY title;

# Find the current salary of all current managers.
# departments table to get dept_name
# employeees table to get employyee names
# salaries  table to get salary number
# dept_manager table to get dept_no and emp_no for mangers of departments
SELECT dept_name, concat(first_name, ' ', last_name) as Name, salary
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON employees.emp_no = dept_manager.emp_no
JOIN salaries ON salaries.emp_no = dept_manager.emp_no
WHERE salaries.to_date > curdate()
AND dept_manager.to_date > curdate()
ORDER BY dept_name;

# Find the number of employees in each department
# tables: department, dept_emp
# bc were doing a count by a specific deplicated result...
# that's our sign were doing a group by on the dept_name
# use current, not historic information
SELECT departments.dept_no, dept_name, count(*)
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.to_date > curdate()
GROUP BY departments.dept_no;

# number 7
# which dept has the highest avg salary?
# use current not historic info
# department table to get dept_name
# dept_emp table to get associate employees numbers to depts
# salaries table to get salary numbers
# probably grouping by dept_name or dept_no
SELECT dept_name, avg(salary)
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN salaries ON salaries.emp_no = dept_emp.emp_no
WHERE dept_emp.to_date > curdate()
AND salaries.to_date > curdate()
GROUP BY departments.dept_no
ORDER BY avg(salary) DESC
LIMIT 1;

# number 8
# who is the highest paid employee in the marketing depts
# employees table to get names
# dept_emp table to attach emp_no to a dept
# we'll need the departments table to get the dept_name
# need the salaries table to get the salary $
SELECT first_name, last_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
JOIN salaries ON salaries.emp_no = dept_emp.emp_no
WHERE dept_emp.to_date > curdate()
AND salaries.to_date > curdate()
AND departments.dept_name = "Marketing"
ORDER BY salary DESC
LIMIT 1;

# which current department manager has the highest salary?
# tables: employees for names, dept_manager for emp_no of managers and dept, salaries for $, departments for dept_name
SELECT first_name, last_name, salary, dept_name
FROM employees
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
JOIN salaries ON salaries.emp_no = dept_manager.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date > curdate()
AND salaries.to_date > curdate ()
ORDER BY salary DESC
LIMIT 1;
# throws an error... fix later

# number 10
# find the names of all current employees, their dept name, and their current manager's name.
# in DB language:
# 1. get all employees who are currently in a dept
# 2. and get their name and their dept name
# 3. and add the current manager of each dept as their current manager
SELECT dept_emp.emp_no, dept_emp.dept_no
FROM dept_emp
WHERE dept_emp.to_date > curdate();

SELECT dept_emp.emp_no, dept_emp.dept_no, employees.first_name, employees.last_name, departments.dept_name
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.to_date > curdate();

SELECT dept_manager.emp_no, dept_manager.dept_no
FROM dept_manager
WHERE dept_manager.to_date > curdate();

SELECT dept_emp.emp_no, dept_emp.dept_no, employees.first_name, employees.last_name, departments.dept_name, dept_manager.emp_no
FROM dept_emp
JOIN employees ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
JOIN dept_manager ON dept_emp.dept_no = dept_manager.dept_no AND dept_manager.to_date > curdate()
JOIN employees ON dept_manager.emp_no = 












