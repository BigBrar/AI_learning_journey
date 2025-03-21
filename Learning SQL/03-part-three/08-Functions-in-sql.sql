-- function to add two numbers 
drop function if exists AddNumbers;
delimiter //
create function AddNumbers(first_num int, second_num int) returns int
deterministic
begin
	declare total int;
    set total = first_num+second_num;
    return total;
end //
delimiter ;

select AddNumbers(12,12);


-- function to calculate age;
drop function if exists CalculateAge;
delimiter //
create function CalculateAge(birthdate DATE) RETURNS INT
deterministic
begin
	declare age int;
    set age = YEAR(curdate()) - YEAR(birthdate);
    return age;
end //
delimiter ;
select CalculateAge('2005-03-03')as age;

-- function to calculate tax 
drop function if exists CalculateTax;
delimiter //
create function CalculateTax(amount decimal(10,2), tax_rate decimal(5,2)) returns decimal(10,2)
deterministic
begin
	declare tax decimal (10,2);
    set tax = amount * (tax_rate/100);
    return tax;
end //
delimiter ;

select CalculateTax(1000.15,18) as tax_amount;


-- FUNCTION WITH IF to categorise age 
drop function if exists CategoriseAge;
delimiter //
create function CategoriseAge(age int) returns varchar(20)
deterministic
begin
	declare category varchar(20);
	if age < 18 then 
		set category = 'child';
	elseif age between 18 and 50 then
		set category = 'adult';
	else 
		set category = 'senior';
	end if;
    return category;
end //
delimiter ;

select CategoriseAge(77);