use employees;

drop table if exists deep;

create table deep(
	person_id serial primary key,
	first_name varchar(50),
    last_name varchar(50),
    age int,
    city varchar(50),
    email varchar(50)
);

insert into deep(first_name, last_name, age, city, email)
values
	('Deepinder','Singh',19,'muktsar','email@.com'),
    ('Deepinder','Singh',19,'muktsar','email@.com'),
    ('Deepinder','Singh',19,'muktsar','email@.com'),
    ('Deepinder','Singh',19,'muktsar','email@.com'),
    ('Deepinder','Singh',19,'muktsar','email@.com'),
    ('Lovepreet','Singh',19,'muktsar','email@.com');
    
select * from deep;


-- deleting the person with id no. 1
delete from deep
where person_id = 1;
select * from deep;


-- deleting all the rows that has last name that starts with 'S'
delete from deep
where last_name like 'S%';
select * from deep;
-- deleting person with first name lovepreet
delete from deep
where first_name = 'Lovepreet';
select * from deep;  -- this will be empty since it removed all the people 


-- delete all the rows of a table 
delete from deep;
select * from deep;