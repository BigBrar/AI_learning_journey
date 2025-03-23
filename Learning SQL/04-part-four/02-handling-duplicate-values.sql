-- Finding only unique rows. 
select distinct * from messy_indian_dataset;

-- finding unique values based on id 
select id from messy_indian_dataset group by id order by id;


-- finding unique values based on names
select name from messy_indian_dataset group by name order by name;

-- finding unique values based on id using rank
select * from (
	select *, row_number() over(partition by id order by id) as 'rank' from messy_indian_dataset
	) as subtable where subtable.rank = 1;
