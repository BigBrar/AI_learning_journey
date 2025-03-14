use restau;
select * from restaurants;
-- WINDOW FUNCTIONS
-- create new column containing average rating of restaurants throughout the dataset
select *, avg(rating) from restaurants; -- this won't work since sql won't be able to map * and avg()
select *, avg(rating) over() as 'avg_rating' from restaurants; -- using window function without round

select *, round(avg(rating) over(),2) as 'avg_rating' from restaurants;  -- earlier command with round to limit the decimal values


-- create new column containing average rating_count of restaurants throughout the dataset
select *, round(avg(rating_count) over(),0) as 'avg_rating_count' from restaurants;

-- new column containing average cost of restaurants 
select *, round(avg(cost) over(),0) as 'avg_cost' from restaurants;

-- column containing average min, max of cost, rating, rating_count of restaurants
select *, min(cost) over() as 'min_cost',
avg(cost) over() as 'avg_cost',
max(cost) over() as 'max_cost',
min(rating) over() as 'min_rating',
avg(rating) over() as 'avg_rating',
max(rating) over() as 'max_rating',
min(rating_count) over() as 'min_rating_count',
avg(rating_count) over() as 'avg_rating_count',
max(rating_count) over() as 'max_rating_count'
  from restaurants;
  
-- create column containing average cost of the city where that specific restaurant is from
select *, avg(cost) over(partition by city) as 'avg_cost' from restaurants;

-- create column containing average cost of the cuisine which that specific restaurant is serving
select *, avg(cost) over(partition by cuisine) as 'avg_cost' from restaurants;

-- create both column together
select *, avg(cost) over(partition by cuisine) as 'avg_cost_cuisine',
avg(cost) over(partition by city) as 'avg_cost_city'
 from restaurants;
 
 -- list restaurants whose cost is more than the average cost 
 -- without window functions
select * from restaurants where cost > (select avg(cost) from restaurants);
-- with window function
select * from(select *, avg(cost) over() as 'avg_cost' from restaurants) t 
where t.cost > t.avg_cost;

-- list the restaurants where cuisine average cost is more than the average cost
select * from(select *, avg(cost) over(partition by cuisine) as 'avg_cost' from restaurants) t 
where t.cost > t.avg_cost;