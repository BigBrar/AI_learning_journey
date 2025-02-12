use employees;

drop table if exists employees;

-- PRIMARY KEY
create table if not exists  employees(
	employee_id SERIAL PRIMARY KEY, -- defining primary key 
    name varchar(50), 
    department varchar(50));
    
    
-- COMPOSITE KEY 
drop table if exists Orders; 
create table Orders(
	order_id SERIAL, 
    customer_id INT,
    order_date DATE,
    PRIMARY KEY(order_id, customer_id)
);
select * from employees;


-- Foreign Key
drop table if exists Orders;
create table Orders(
	order_id SERIAL PRIMARY KEY, 
    customer_id INT, 
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES employees (employee_id));
select * from Orders;



-- Unique & unique constraints keys
drop table if exists Employees;
create table if not exists Employees(
		employee_id serial primary key,
		email varchar(50) unique,
		phone_no varchar(50) unique, 
		name varchar(50),
		department varchar(50),
		unique(email,phone_no)
		);
	select * from Employees;
    
    
-- Check constraint
drop table if exists employees;
create table employees(
	employee_id serial primary key,
		email varchar(50) unique,
		phone_no varchar(50) unique, 
        age int check (age>=18),	
		name varchar(50),
		department varchar(50),
		unique(email,phone_no)
		);
select * from employees;