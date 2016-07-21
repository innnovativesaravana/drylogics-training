
How to install postgres database.
How to create a database.
How to login in psql prompt.
How to create a table.
How to insert into table.


SQL
  Basic Syntax
  Field Retrieval
  Count Retrieval
  Basic Filters (where clause)
    equals and like
  Distinct keyword

Work
-----
1) employee count
select count(*) from employees;
select count(1) from employees;
select count(name) from employees;
2) 


Exercise
--------
1) Find all departments in the company?
2) How many employees are in Accounting Team?
3) Find names of all women in Public Relations.
4) Find all employees whose name begins with 'M'

Reading
-------
1) other filters (IN, >, <, <>)
2) specifying multiple filters (AND, OR)
2) order by clause
3) other functions available in postgres (max, min, avg)