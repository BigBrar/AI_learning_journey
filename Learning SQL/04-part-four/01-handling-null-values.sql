select * from messy_indian_dataset;

-- find rows with missing values in any column
select * from messy_indian_dataset
	where name is null or age is null or gender is null or email is null or phone_number is null 
    or city is null or state is null or purchase_amount is null or purchase_date is null;
    
-- find rows where values are not null 
select * from messy_indian_dataset
	where name is not null and age is not null and gender is not null and email is not null and phone_number is not null 
    and city is not null and state is not null and purchase_amount is not null and purchase_date is not null;
    
-- saving table without null values
create table if not exists clean_table as 
	select * from messy_indian_dataset
	where name is not null and age is not null and gender is not null and email is not null and phone_number is not null 
    and city is not null and state is not null and purchase_amount is not null and purchase_date is not null;
select * from clean_table;

-- filling all missing age with specific values (in this case replace all missing age with 0)
update messy_indian_dataset set age = coalesce(age,0);
select * from messy_indian_dataset;


-- filling all_nulls with specific values 
update messy_indian_dataset
set 	name = coalesce(name,'Unknown'),
	gender = coalesce(gender,'Unknown'),
    email = coalesce(email,'Unknown'),
    phone_number = coalesce(phone_number,'Unknown'),
    state = coalesce(state,'Unknown'),
    purchase_date = coalesce(purchase_date,'2020-03-03');
select * from messy_indian_dataset;

-- replace null with average amount values in purchase amount
update messy_indian_dataset 
set purchase_amount = (
	select avg_purchase_amount from(
		select avg(purchase_amount) as avg_purchase_amount from messy_indian_dataset as subquery
        ) as subquery
    ) where purchase_amount is null;
select * from messy_indian_dataset;
    
-- filling null city with most frequent city 
update messy_indian_dataset
set city = (
	select most_frequent from (
		select city as most_frequent, count(*) as 'frequency' -- finding out which city is most frequent 
		from messy_indian_dataset where city is not null 
		group by city order by frequency desc limit 1 -- answer "Mumbai
	)as subquery
)where city is null;

select * from messy_indian_dataset
