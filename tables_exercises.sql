use employees;

SHOW TABLES;

DESCRIBE departments;

DESCRIBE salaries;

DESCRIBE employees;

# Answer to number 5: int, date, varchar, enum.

# Answer to number 6: salaries

# Answer to number 7: titles

# Answer to number 8: employees, salaries

# Answer to number 9: There doesn't seem to be any overlap in the variables in each table. Both tables have all NULL, require the fields to all be filled. The primary keys are both numbers, but the dept_no takes in a char, and the emp_no takes in an int.

show create table dept_manager;