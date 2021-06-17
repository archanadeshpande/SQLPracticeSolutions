/*
The objective of this Kata is to show that you are proficient at string manipulation (and perhaps that you can use extensively subqueries).

You will use people table but will focus solely on the name column

name
Greyson Tate Lebsack Jr.
Elmore Clementina O'Conner
you will be provided with a full name and you have to return the name in columns as follows.

name	first_lastname	second_lastname
Greyson Tate	Lebsack	Jr.
Elmore	Clementina	O'Conner
Note: Don't forget to remove spaces around names in your result. Note: Due to multicultural context, if full name has more than 3 words, consider first 2 as name

https://www.codewars.com/kata/594323fde53209e94700012a/train/sql
*/


SELECT 
case when length(SPLIT_PART(name,' ',4)) <> 0
then concat(SPLIT_PART(name,' ',1),' ',SPLIT_PART(name,' ',2))
else
SPLIT_PART(name,' ',1) end as name,
case when length(SPLIT_PART(name,' ',4)) <> 0
then SPLIT_PART(name,' ',3)
else
SPLIT_PART(name,' ',2) end as first_lastname,
case when length(SPLIT_PART(name,' ',4)) <> 0
then SPLIT_PART(name,' ',4)
else
SPLIT_PART(name,' ',3) end as second_lastname
FROM people 