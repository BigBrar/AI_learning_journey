use employees;

-- will only select the sales department
select name,age,department from employees where age > 30 and department = 'Sales'; 

-- only shows ages between 30 and 40  
select name,age from employees where age > 30 and age < 40;

-- employees from sales or marketing
select name, department from employees where department = 'Sales' or department = 'marketing';

-- get all names starting with 'J'
select name, age from employees where name like 'J%';

-- get all people with null departments 
select * from employees where department is null;

-- get all people with not null departments
select * from employees where department is not null;

-- get all people with not null departments and ages
select * from employees where department is not null and age is not null;

-- using IN command 
select * from employees where department in ('sales','marketing');

-- using IN command with NOT
select * from employees where department not in ('sales', 'marketing');

-- using IN command with a conditional and 
select * from employees where (department in ('sales', 'marketing')) and age > 30 ;