use employees;

# Number 1
SELECT hire_date, emp_no
FROM employees
WHERE hire_date IN (
	SELECT hire_date 
	FROM employees
	WHERE emp_no = '101010'
	);
	
# Number 2
SELECT emp_no, title
FROM titles
WHERE emp_no IN (
	SELECT emp_no
	FROM employees
	WHERE first_name = 'Aamod'
	);
	
# Number 3
# need to_date from titles
# need emp_no from titles and employees
# count function
SELECT DISTINCT employees.emp_no
FROM employees
JOIN titles ON employees.emp_no = titles.emp_no
WHERE titles.emp_no IN (
	SELECT DISTINCT emp_no
	FROM titles
	WHERE MAX(to_date) < curdate()
	);