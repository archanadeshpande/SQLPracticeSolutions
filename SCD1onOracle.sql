--SCD 1: to keep exact snapshot of the data
merge into emp_scd1 s1
using (select s.*,coalesce(s.employee_id,t.employee_id) as missing_id, case when s.employee_id is null then 'Y' else 'N' end as match_flag
from emp_scd1 t full outer join emp_curr s on s.employee_id = t.employee_id) curr
--here taking full outer join to mark the deleted rows in source table 
on (s1.employee_id = curr.missing_id)
when matched then
update set
--performing update on the changed rows
  s1.email=coalesce (curr.email,'test'),
  s1.phone_number=curr.phone_number,
  s1.date_tmp=sysdate,
  s1.match_flag = curr.match_flag
  where (s1.email <> curr.email OR s1.phone_number <> curr.phone_number OR s1.match_flag <> curr.match_flag)
--deleting the deleted rows
delete where s1.match_flag = 'Y'
when not matched then
--inserting the new rows
  insert 
values (curr.EMPLOYEE_ID,curr.FIRST_NAME,curr.LAST_NAME,curr.EMAIL,curr.PHONE_NUMBER,curr.HIRE_DATE,curr.JOB_ID,curr.SALARY,curr.COMMISSION_PCT,curr.MANAGER_ID,curr.DEPARTMENT_ID,sysdate,curr.match_flag);