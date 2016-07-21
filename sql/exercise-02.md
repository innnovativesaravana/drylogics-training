

1) other filters (IN, >, <, <>)
2) specifying multiple filters (AND, OR)
2) order by clause
3) other functions available in postgres (max, min, avg)

year out of date



What is the average age of employees?
 select avg(age(birth_date)) from employees;
What is the maximum and minimum age of employees?
  SELECT max(age(birth_date)) from employees;
  SELECT min(age(birth_date)) from employees;

Who has worked in the company for the most number of years?
Who is the second oldest employee in Public Relations?
List the employees who are going to retire in 2017? (retirement age is 30)



List names of all new joinees(who joined this year) in ascending order of their age?