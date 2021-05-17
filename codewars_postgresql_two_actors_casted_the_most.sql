/*Given the the schema presented below find two actors who cast together the most and list titles of only those movies they were casting together. Order the result set alphabetically by the movie title.

Table film_actor
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
actor_id    | smallint                    | not null
film_id     | smallint                    | not null
...
Table actor
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
actor_id    | integer                     | not null 
first_name  | character varying(45)       | not null
last_name   | character varying(45)       | not null
...
Table film
 Column     | Type                        | Modifiers
------------+-----------------------------+----------
film_id     | integer                     | not null
title       | character varying(255)      | not null
...
The desired output:
first_actor | second_actor | title
------------+--------------+--------------------
John Doe    | Jane Doe     | The Best Movie Ever
...
first_actor - Full name (First name + Last name separated by a space)
second_actor - Full name (First name + Last name separated by a space)
title - Movie title
Note: actor_id of the first_actor should be lower then actor_id of the second_actor*/


with ac as
(
select 1 as dummy, f1.actor_id as a1,f2.actor_id as a2 from film_actor f1 left join film_actor f2 on f1.film_id =f2.film_id
where f1.actor_id < f2.actor_id 
group by f1.actor_id, f2.actor_id 
order by count(f1.film_id) desc limit 1
)

select a1.first_name ||' '|| a1.last_name as first_actor,
a2.first_name ||' '|| a2.last_name as second_actor,
m.title
from film_actor f1 inner join film_actor f2 on f1.film_id = f2.film_id
inner join film m on f1.film_id = m.film_id
inner join actor a1 on f1.actor_id = a1.actor_id
inner join actor a2 on f2.actor_id = a2.actor_id
where f1.actor_id in (select a1 from ac) and f2.actor_id in (select a2 from ac);




