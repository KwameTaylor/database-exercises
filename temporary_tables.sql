use darden_1035;

CREATE TEMPORARY TABLE employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

ALTER TABLE employees_with_departments ADD full_name VARCHAR(31);

UPDATE employees_with_departments

# 2
SELECT *
FROM sakila.payment;

describe sakila.payment;

ALTER TABLE payments modify amount INT UNSIGNED;

UPDATE payments SET amount = amount * 100;

CREATE TEMPORARY TABLE payments AS
select *, amount * 100 as pennies
from sakila.payment;

SELECT * from payments;

ALTER TABLE payments modify pennies INT UNSIGNED;

SELECT * from payments;
describe payments;

 