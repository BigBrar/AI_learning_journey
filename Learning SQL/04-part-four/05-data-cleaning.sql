select * from messy_indian_dataset;

-- removing extra spaces from name 
update messy_indian_dataset
	set name = trim(name);
select * from messy_indian_dataset;

-- handling lower and uppercases to be consistent in names
update messy_indian_dataset
	set name = concat(upper(substring(name,1,1)), lower(substring(name,2)));
select * from messy_indian_dataset;

-- update gender
update messy_indian_dataset
	set gender = trim(gender);
select * from messy_indian_dataset;

-- update city 
update messy_indian_dataset
	set city = trim(city);
select * from messy_indian_dataset;

-- update state
update messy_indian_dataset
	set state = trim(state);
select * from messy_indian_dataset;

-- clean and update email
update messy_indian_dataset
	set email = trim(lower(REGEXP_REPLACE(email, '[^a-zA-Z0-9@.]+',''))); -- will support only given characters
select * from messy_indian_dataset;

-- clean and update phone
update messy_indian_dataset
	set phone_number = trim(REGEXP_REPLACE(phone_number, '[^0-9]+','')); -- will only support char from 0-9
select * from messy_indian_dataset;

-- extracting username from email before '@' 
alter table messy_indian_dataset
	add column username varchar(20);
update messy_indian_dataset
	set username = substring_index(email, '@', 1);
select * from messy_indian_dataset;

-- create location (city, state)
alter table messy_indian_dataset
	add column location varchar(50);
update messy_indian_dataset
	set location = concat(city,', ',state);
select * from messy_indian_dataset;

-- amount without gst, basically removing 18% gst from purchase_amount
alter table messy_indian_dataset
	add column without_gst decimal(10,2);
update messy_indian_dataset
	set without_gst = purchase_amount * .82;
select * from messy_indian_dataset;

-- adding expiry date (estimating that the expiry date is 3 years after purchase date)
alter table messy_indian_dataset
	add column expiry_date DATE;
update messy_indian_dataset
	set expiry_date = DATE_ADD(purchase_date, INTERVAL 3 Year);

select * from messy_indian_dataset;

-- removing rows with invalid phone number
delete from messy_indian_dataset
	where length(phone_number) != 10 OR phone_number REGEXP '[^0-9]';
select * from messy_indian_dataset;

-- cleaning gender even further, where male = M and female = F
update messy_indian_dataset
	set gender = case
		when gender in ('M','m','Male','MALE','male') then 'M'
		when gender in ('F','f','Female','FEMALE','female') then 'F'
        else 'other'
        end;
select * from messy_indian_dataset;

-- cleaning/validating age
delete from messy_indian_dataset
	where age <=0 or age>=100;
select * from messy_indian_dataset;