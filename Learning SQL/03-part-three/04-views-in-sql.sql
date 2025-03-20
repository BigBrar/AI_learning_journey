use restau;

-- 1. Create the view
drop view if exists rest;
create view rest as 
(select name, city, rating, rating_count*cost as 'revenue' from restaurants);

select * from rest;

-- 2. create view of sweet dishes (restaurants with 'sweets' as cuisine
drop view if exists sweet_restaus;
create view sweet_restaus as 
(select * from restaurants where cuisine in ('sweets','desserts','ice cream','bakery'));

select * from sweet_restaus;

-- top 100 most visited restaurants
drop view if exists top_100;
create view top_100 as (select * from restaurants order by rating_count desc limit 100);
select * from top_100;

-- top most expensive restaurants 
drop view if exists top_100_expensive;
create view top_100_expensive as 
(select * from restaurants order by cost desc limit 100);
select * from top_100_expensive;

-- create view for top-rated restaurants in each city
drop view if exists top_rated_rest_per_city;
create view top_rated_rest_per_city as (
select * from ( select *, row_number() over(partition by city order by rating desc) as 'rank' from restaurants)r
where r.rank = 1
);

select * from top_rated_rest_per_city;