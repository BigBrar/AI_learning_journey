-- cases in SQL 

use employees; 

select * from employees;

-- basic case for sales team where if department is sales it will print 'sales team' else 'other'
select name, 
case department
    when 'sales' then 'sales'
    else 'other'	
end as employee_name from Employees;


-- basic case for both sales and marketing team
select name, 
case department
    when 'sales' then 'sales team'
    when 'marketing' then 'marketing'
    else 'other'	
end as employee_name from Employees;


-- different cases for ages above and below 30 
select name, 
case 
	when age < 30 then 'young'
    when age <= 30 and age > 40 then 'budhau'
    else 'aliens'
end from employees;


-- another case to find names that start with 'J'
select 
case 
	when name like 'J%' then name
    else 'notJ'
end as changed_names from employees;
	

-- nested conditional statements
select name, 
case 
	when age < 30 then 
		case 
			when department = 'sales' then 'JR. sales'
            else 'no jr. sales'
		end
    else 'aliens'
end from employees;


-- handling empty departments with case
select name,
case 
	when department is null then 'NAN'
    else department
end as department_alloted from employees;