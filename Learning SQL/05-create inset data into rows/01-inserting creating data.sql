use employees ; 

drop table if exists employees;
create table employees(
	employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    department_id int,
    hire_date date
);

select * from employees;

-- insert values in a single row
insert into employees(employee_id, first_name, last_name, department_id, hire_date)
values (1,'Deepinder','Singh',1,'2025-02-12');
select* from employees;


-- insert multiple rows at once
insert into employees(employee_id, first_name, last_name, department_id, hire_date)
values 
	(2,'Lovepreet','Singh',4,'2020-02-12'),
    (3,'Charanjit','Singh',7,'2020-02-12'),
    (4,'Daljit','Dosanjh',4,'2020-02-12');
select* from employees;


-- add partial data
insert into employees(first_name, last_name) -- not giving the whole data 
values ('Joginder','Singh'); -- primary key will be auto created because of SERIAL parameter 
select * from employees;


-- inserting data in different order 
insert into employees(department_id, last_name, first_name)
values (4, 'Bishnoi','Laurence');
select * from employees;


-- adding current date as default autofill value
drop table if exists example_table;
create table example_table(
	id serial primary key,
    name varchar(50) default 'no name given', -- if no name is give it will fill 'no name given'
    hire_date timestamp default current_timestamp,
    status varchar(50) default 'active' -- this makes the default values 'active'
);
select * from example_table;

-- testing out if automatic date and status work
insert into example_table(name)
values('Deepinder');
select * from example_table;


-- testing out if auto date, name and status work 
insert into example_table()
values();
select * from example_table;


-- testing filling data without order 
use employees;
insert into employees()
values(90,'jaspreet','singh/kaur',5,'2024-05-06'); -- the id should be unique.
select * from employees;