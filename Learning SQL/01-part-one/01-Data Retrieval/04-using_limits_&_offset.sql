use employees; 

-- returns limited results, in this case first 5 numbers
select * from employees limit 5;

-- returns limited results but starts from assigned index.
select * from employees limit 5 offset 5;

-- and ofcourse we can also use conditionals with this 
select * from employees where department = 'sales' limit 5 offset 5;