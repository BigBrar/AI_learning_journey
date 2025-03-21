-- temporary tables : these exist only until the server is restarted.

-- creating a simple temporary table
create temporary table temp_restau as select * from restaurants;
select * from temp_restau;

-- drop temp table if exists 
drop table if exists temp_restau;

-- create temp table containing only restaus from "sirsa"
drop table if exists sirsa_restaus;
create temporary table sirsa_restaus as select * from restaurants where city = 'sirsa';
select * from sirsa_restaus;

-- 