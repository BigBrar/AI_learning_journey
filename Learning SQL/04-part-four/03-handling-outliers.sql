-- FINDING OUTLIERS in SQL 

-- finding standard_deviation 
select stddev(purchase_amount) as 'standard_deviation' from messy_indian_dataset;

-- finding mew (mean) 
select avg(purchase_amount) as 'mean' from messy_indian_dataset;


-- finding outliers based on z-score 
select *, ABS(purchase_amount - avg(purchase_amount ) over()) / stddev(purchase_amount) over() as 'z_score' from messy_indian_dataset;

-- remove outliers based on specific z-score
select * from (
	select *, ABS(purchase_amount - avg(purchase_amount ) over()) / stddev(purchase_amount) over() as 'z_score' from messy_indian_dataset
    ) as subtable where subtable.z_score < 2;