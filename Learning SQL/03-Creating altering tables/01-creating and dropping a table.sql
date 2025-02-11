-- deleting the table
drop table if exists deep;

-- creating the table
create table deep (id INT, name VARCHAR(50), age INT, department VARCHAR(50));

-- create table if not exists deep (id INT, name VARCHAR(50), age INT, department VARCHAR(50));

select * from deep;

drop table if exists deep ;

-- we can also assign if some values cannot be null like 'name' or for ages to be more than 18 always
create table deep (
id SERIAL, -- now id's will be in serial format like 1,2,3,4,5 
name VARCHAR(50) not null, -- now the name column cannot be null
age INT check(age>18), -- will only accept ages greater than 18 
department VARCHAR(50),
hire_date date, -- will take only date inputs
);