/*For this challenge you need to create a basic Increment function which Increments on the age field of the peoples table.

The function should be called increment, it needs to take 1 integer and increment that number by 1.

You may query the people table while testing but the query must only contain the function on your final submit.

important: you must remove all comments when submitting the kata.
people table schema
id
name
age*/
CREATE OR REPLACE FUNCTION "increment" (NUM int) RETURNS int LANGUAGE PLPGSQL AS $$
declare
	inc integer;
begin
  	inc=num+1;
	return inc;
end;
$$;