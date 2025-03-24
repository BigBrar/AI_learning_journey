use restau;

-- add new columns day, month, year
alter table messy_indian_dataset
	add column day int,
    add column month int,
    add column year int;
    
select * from messy_indian_dataset;

-- update the new columns with extracted day, month and year values
update messy_indian_dataset
	set day = DAY(purchase_date),
    month = MONTH(purchase_date),
    year = YEAR(purchase_date);
    
select * from messy_indian_dataset;

-- get the name of the day based on purchase_date
alter table messy_indian_dataset
	add column day_of_week varchar(10);
update messy_indian_dataset 
	set day_of_week = DAYNAME(purchase_date);
select * from messy_indian_dataset;

-- get the name of month based on purchase date
alter table messy_indian_dataset
	add column name_of_month varchar(10);
update messy_indian_dataset 
	set name_of_month = monthname(purchase_date);
select * from messy_indian_dataset;