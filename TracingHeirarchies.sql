/*
Problem statement: 
a reports to b
b reports to c
c reports to d
x reports to y
y reports to z

output should be
a reports bcd
b reports cd
c reports d
x reports yz
y reports z
*/

create table recursivetrace
( col1 char(1), col2 char(1));

insert into recursivetrace values('a','b');
insert into recursivetrace values('b','c');
insert into recursivetrace values('c','d');
insert into recursivetrace values('x','y');
insert into recursivetrace values('y','z');

select * from recursivetrace;

with org_chart (col,
  col1,col2, lvl
) as (
    select col1 || col2 as col,col1,col2, 1 lvl
  from   recursivetrace
  where  col2 in (select t1.col2 from recursivetrace t1 left outer join recursivetrace t2 on t1.col2=t2.col1 where t2.col2 is null)
  union  all
  select r.col1 || oc.col as col,r.col1,r.col2, oc.lvl + 1
  from   org_chart oc
  join   recursivetrace r
  on     r.col2 = oc.col1
)
  select col1, substr(col,2) from org_chart order by col1;
  
  
  