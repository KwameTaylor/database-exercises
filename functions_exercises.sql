use employees;

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%' and last_name LIKE '%E';

SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'E%' and last_name LIKE '%E';

SELECT emp_no, birth_date, hire_date, first_name, last_name, gender, datediff(curdate(), hire_date) AS days_employeed
FROM employees
WHERE birth_date like '%-12-25' AND hire_date like '199%';

SELECT MIN(salary) AS smallest_salary, MAX(salary) AS largest_salary
FROM salaries;

SELECT first_name, last_name, birth_date
		, LOWER(
			CONCAT(
				SUBSTR(first_name, 1, 1), 
				SUBSTR(last_name, 1, 4), 
				"_",
				SUBSTR(birth_date, 6, 2),
				SUBSTR(birth_date, 3, 2)
				)
			)  AS username
FROM employees;