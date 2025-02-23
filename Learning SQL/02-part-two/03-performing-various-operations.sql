use class;

select * from gfgdata limit 5;


-- find all unique brands 
select distinct brand_name from gfgdata;

-- find number of unique brands 
select count(distinct brand_name) from gfgdata;

-- find number of products in each brand
select brand_tag, count(product_tag) from gfgdata group by brand_tag;

-- finding the brand who has the most number of products 
select brand_tag, 
count(product_tag) as 'products' -- remember the column name is 'products'
from gfgdata 
group by brand_tag  -- will be grouped by brand_tag for each r
order by products -- we used the earlier defined 'products' name to order by that in descending order
desc limit 5;

-- find top 5 most expensive brands based on their discounted price
select brand_tag, avg(discounted_price) as 'average_price' from gfgdata group by brand_tag order by average_price desc limit 5 ;

-- find top 5 least expensive brands based on their discounted price
select brand_tag, avg(discounted_price) as 'average_price' from gfgdata group by brand_tag order by average_price asc limit 5;

-- find top 10 best selling product categories
select product_tag, sum(rating_count) as 'rating_count' 
from gfgdata group by product_tag 
order by rating_count desc limit 10;

-- find top 10 brands who give maximum discount 
select brand_tag, avg(discount_percent) as 'average_discount'
from gfgdata group by brand_tag 
order by average_discount desc limit 10;

-- find top 5 most expensive product categories 
select product_tag, avg(discounted_price) as 'average_price'
from gfgdata group by product_tag
order by average_price desc limit 5;

-- brand report 
select brand_tag, 
	min(marked_price) as 'min_price',
    max(marked_price) as 'max_price',
    avg(marked_price) as 'avg_price'
from gfgdata group by brand_tag  order by max_price desc ;

-- which product_category of any brand is sold the most?
select brand_tag, product_tag, 
sum(rating_count) as 'sold_products'
from gfgdata group by product_tag,brand_tag  -- group by 2 categories 
order by sold_products desc limit 10;

-- top 5 brands who sold most number of tshirts 
select brand_tag, product_tag,
sum(rating_count) as 'tshirts_sold', 
avg(discounted_price) as 'average_price' -- tells the average price of a tshirt sold
from gfgdata
where product_tag = 'tshirts' -- this filters those whose category is not tshirts
group by brand_tag, product_tag
order by tshirts_sold desc limit 5 ;

-- top 5 brands who sold most number of shirts 
select brand_tag, product_tag,
sum(rating_count) as 'tshirts_sold', 
avg(discounted_price) as 'average_price' -- tells the average price of a tshirt sold
from gfgdata
where product_tag = 'shirts' -- this filters those whose category is not tshirts
group by brand_tag, product_tag
order by tshirts_sold desc limit 5 ;

-- top 5 brands who sold most number of jeans 
select brand_tag, product_tag,
sum(rating_count) as 'tshirts_sold', 
avg(discounted_price) as 'average_price' -- tells the average price of a tshirt sold
from gfgdata
where product_tag = 'jeans' -- this filters those whose category is not tshirts
group by brand_tag, product_tag
order by tshirts_sold desc limit 5 ;

-- Most popular product_name listed on Myntra 
	select product_name, count(product_name) as 'name_count'
	from gfgdata group by product_name order by name_count desc;
    
-- Number of products sold for every rating
select rating, count(rating) as 'rating_category' from gfgdata group by rating order by rating asc;

-- number of products sold for every rating by nike 
select rating, count(rating) as 'rating_category', brand_tag
from gfgdata where brand_tag = 'nike' -- just adding the 'where' statement does the thing
group by rating, brand_tag
order by rating asc;

-- number of products sold for every rating in tshirts category 
select rating, count(rating) as 'rating_category', product_tag
from gfgdata where product_tag = 'tshirts' -- just adding the 'where' statement does the thing
group by rating, product_tag
order by rating asc;


-- relation between price of the tshirt and its rating wrt people rated 
select rating, round(avg(rating_count)) as 'rating_count', avg(discounted_price) as average_price
from gfgdata where product_tag = 'tshirts'
group by rating
order by average_price desc;


-- find average rating for each product category(product_tag) with number of products and total rating count
select product_tag, avg(rating) as 'avg_rating', count(*) as 'total_products', 
sum(rating_count) as 'total_rating_count'
from gfgdata group by product_tag order by avg_rating desc;

-- find the brand with the highest average rating among products with a discounted price greater than 5000
select brand_tag, avg(rating) as 'avg_rating'
from gfgdata where discounted_price > 5000
group by brand_tag order by avg_rating desc;