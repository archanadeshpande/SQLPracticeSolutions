/*Your manager has given you a task to create a report to measure the impact of the next company-wide salary increase. The rules for the salary increase are encapsulated in the function pctIncrease, which takes a department_id as a parameter and returns the percent increase as a value between 0 and 1.

You've managed to create a query that would produce the desired results, but it is currently very slow and doesn't finish in the required time window.

Your objective in this kata is to optimize this query. The success criteria is to manage to run the query within the allowed kata solution time window (12 seconds for SQL katas).

The provided initial solution produces the correct result, but it does not run within the allowed time window.

Data model
Table: Employees
----------------
employee_id   INT / PK
first_name    TEXT
last_name     TEXT
salary        DECIMAL
department_id INT / FK

Table: Departments
------------------
department_id   INT / PK
department_name TEXT

Given query:
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name,
       e.salary AS old_salary,
       e.salary * (1 + pctIncrease(e.department_id)) AS new_salary
  FROM employees   e,
       departments d
 WHERE e.department_id = d.department_id
 ORDER BY 1;
*/

with dept_cte as
(select pctIncrease(department_id) as inc, department_id, department_name from departments)

SELECT e.employee_id,
       e.first_name,
       e.last_name,
       d.department_name,
       e.salary AS old_salary,
       e.salary * (1 + inc) AS new_salary
  FROM employees   e,
       dept_cte d
 WHERE e.department_id = d.department_id
 ORDER BY 1;
