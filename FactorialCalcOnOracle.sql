create or replace function factorial(n integer) return int 
as 
val integer;
product  integer;
begin
  dbms_output.enable(999999);
  val := n-1;
  if(val>0)
  then
     product := n*factorial(val);
     return product;
  end if;
  return n;
end factorial;

set serveroutput on;
declare
value integer;
begin
value:=factorial(3);
dbms_output.put_line(value);
end;

---------------Using loop and block---------------

set serveroutput on;

declare
facto pls_integer := 3;
inter_val pls_integer :=1;
begin

for i in 1 .. facto
Loop
  inter_val:=i*inter_val;
end loop;
dbms_output.put_line('The factorial is: ' || inter_val);
end;
/
  

