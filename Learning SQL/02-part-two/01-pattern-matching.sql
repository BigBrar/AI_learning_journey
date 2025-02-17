use class;
select * from students;


-- find the person whose name starts with 'D'
select * from students where name like 'D%';

-- find the person whose name contains 'ee'
select * from students where name like '%ee%';

-- find the person whose name starts with 'D' and ends with 'R'
select * from students where name like 'D%R';

-- finding based on length of a string 
select * from students where name like '_________'; -- here 9 space dashes '_' means it will return name with 9 letters.

-- finding out person whose name's second character is 'e'
select * from students where name like '_e%';

-- finding out person whose name's second character is 'e' and fourth character is 'p'
select * from students where name like '_e_p%';

