use restau;

-- create a new table that only contains restaurants of city 'sirsa'
drop table if exists sirsa_restau;
create table if not exists sirsa_restau as select * from restaurants where city = 'sirsa';

select * from sirsa_restau;

-- create table 'city_statistics' aggregated for each city
drop table if exists city_statistics;
create table if not exists city_statistics as 
select city, avg(rating) as 'avg_rating', count(*) as 'number_of_res' from restaurants group by city;

select * from city_statistics;

-- create table containing restaurants with cost more than 500 
drop table if exists expensive_restau;
create table if not exists expensive_restau as 
select * from restaurants where cost > 500 ;

select * from expensive_restau;
