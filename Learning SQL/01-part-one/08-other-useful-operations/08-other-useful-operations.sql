-- creating the database and using it as default
create database class;
use class;

-- creating table inside that database.
create table students(
	id serial primary key,
    name varchar(50),
    roll_no int,
    class_section varchar(10)
);

-- showing specific columns 
select name, id from students;
select * from students;

-- inserting some data 
insert into students(name, roll_no)
values 
	('Deepinder',12),
    ('Lovepreet',22);
select * from students;
    
-- performing mathematical functions
select (roll_no - id) as testing from students;
select id, roll_no, roll_no - id from students;

-- another column created with mathematical function
select roll_no, id, roll_no - id as subtracted, (roll_no-id/roll_no)*100 as division from students;


-- finding unique values 
select distinct(roll_no) as unique_roll_no from students;


-- adding where clause 
select roll_no, id, name from students where name like "D%"; -- only select rows where name starts with 'D'
select roll_no, id, name from students where roll_no > 0; -- where roll no is greater than 0


-- adding distinct with where | count shows the number of total rows with supported query 
select count(distinct(roll_no)) from students where roll_no > 0;

-- multiple where using 'and'
select name, id from students where roll_no > 0 and roll_no < 10;

-- using between keyword 
select * from students;
select name, id from students where roll_no between 0 and 30; -- will return roll_no between 0 to 10


-- using 'or' keyword 
select id,name,roll_no from students where (id = 1 or id = 2); 
select id,name,roll_no from students where (id = 1 or id = 2) and roll_no < 30; -- using an 'and' alongside 'or'

-- using 'not' keyword 
select id,name,roll_no from students where not roll_no>30; -- return those rows where roll_no is not greater than 30 

-- using 'in' keyword 
select id,name,roll_no from students where roll_no in (12,22); 
select id,name,roll_no from students where roll_no not in (12); -- will not print roll_no 12 