use employees;

SHOW TABLES;

DESCRIBE departments;

DESCRIBE salaries;

DESCRIBE employees;

# Answer to number 5: int, date, varchar, enum.

# Answer to number 6: salaries

# Answer to number 7: titles, departments

# Answer to number 8: employees, salaries

# Answer to number 9: There doesn't seem to be any overlap in the variables in each table. Both tables have all NULL, require the fields to all be filled. They are both within the employees database, and there are other tables that seem related to each such as dept_emp and employees_with_departments.

show create table dept_manager;