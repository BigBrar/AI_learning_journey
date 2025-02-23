-- Basic Query: Find the average rating of products
select avg(rating) as 'avg_rating' from gfgdata;

-- Subquery in WHERE Clause: find the brand names with a rating higher than the average rating
-- subquery is basically writing another query inside an existing query 
-- so instead of this 
select brand_name from gfgdata where rating > 2.26;
-- you can do this - 
select brand_name from gfgdata where rating > (select avg(rating) from gfgdata);


-- Subquery in SELECT clause: retrieve the product name along with the averating rating of products
select  product_name, (select avg(rating) from gfgdata) as 'avg_rating' from gfgdata;

-- Subquery for multiple results: find total rating count of products for each brand compared to the overall
-- average rating count
select brand_name, 
(select sum(rating_count) from gfgdata where brand_name = p.brand_name) as total_rating_count
from (select distinct brand_name from gfgdata) as p;

-- the upper query without using subquery 
select brand_name, sum(rating_count) from gfgdata group by brand_name;
