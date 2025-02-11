use employees;

-- will only select the sales department
select name,age,department from employees where age > 30 and department = 'Sales'; 

-- only shows ages between 30 and 40  
select name,age from employees where age > 30 and age < 40;

-- employees from sales or marketing
select name, department from employees where department = 'Sales' or department = 'marketing';

-- get all names starting with 'J'
select name, age from employees where name like 'J%';