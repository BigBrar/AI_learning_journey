use restau;

-- syntax errors 
select * form restaurants;

-- logical error 
select * from restaurants where rating > 4.0 and rating < 2.0;

-- Data type exception
select * from restaurants where rating = 'high'; -- does not work since rating has only float values

-- performance errors 
select * from restaurants where rating = 4.5;

-- aggregate function error 
select city,count(*) from restaurants; -- no group by because count only has one value
