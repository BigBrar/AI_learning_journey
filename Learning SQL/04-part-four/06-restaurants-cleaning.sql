use restau;
select * from restaurants;

-- finding the restaurant id from link end
select *, substring_index(link, '-',-1) as id from restaurants;

-- updating the restaurant_id in the original table
drop table if exists rest_1;
create table if not exists rest_1 as (
	select *, substring_index(link,'-',-1) as new_id from restaurants
	);
select * from rest_1;

-- clean the name column and update it on the table 
drop table if exists rest_2;
create table if not exists rest_2 as (
	select *, lower(trim(name)) as new_name from restaurants
	);
select * from rest_2;