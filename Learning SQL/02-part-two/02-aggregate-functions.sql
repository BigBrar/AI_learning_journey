use class;

select * from gfgdata;


-- length of the whole table 
select count(*) from gfgdata;
select count(product_name) from gfgdata; -- certain column length ( will be the same)

-- finding out the average marked and discounted price 
select avg(marked_price) as average_marked_price from gfgdata;
select avg(discounted_price) as average_discounted_price from gfgdata;

-- finding the maximum price 
select max(marked_price) as max_price from gfgdata;

-- finding the minimum price
select min(marked_price) as min_price from gfgdata;

-- finding sum of all ratings
select sum(rating_count) as total_ratings from gfgdata;

-- finding all unique brands 
select distinct(brand_name) as unique_brands from gfgdata;

-- counting total unique brands 
select count(distinct(brand_name)) as unique_brands from gfgdata;