use employees;
drop table if exists deep;

create table deep(
	id serial primary key,
    first_name varchar(60),
    last_name varchar(60),
    age int,
    gender varchar(10) default 'male'
);

-- creating dummy data
insert into deep(first_name, last_name ,age)
values
	('Deepinder', 'Singh',19),
	('Deepinder', 'Singh',19),
    ('Lovepreet',' Singh',24),
    ('Elon','Musk',40),
    ('Diljit','Dosanjh',40);
select * from deep;


-- updating age based on id
select * from deep;
update deep
set age = 41
where id = 1;
select * from deep;


-- updating multiple things at once based on id
update deep
set age = 42, name = 'Badal Singh'
where id = 1;
select * from deep;



-- updating gender based on last name
update deep
set gender = 'sardar'
where last_name = 'Singh';
select * from deep;