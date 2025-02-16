use employees; 

-- this will order or sort the output by ages
select * from employees order by age;

-- asc = ascending order
select * from employees order by age asc;

-- desc = descending order
select * from employees order by age desc;

-- will be sorted based on both age & name
select * from employees order by age, name;
