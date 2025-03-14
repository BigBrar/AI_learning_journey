select * from restaurants;

-- rank every restaurant from most expensive to least expensive
select name, cost from restaurants order by cost desc;
-- doing the same using rank 
select *, rank() over(order by cost desc) as 'rank' from restaurants;

-- rank every restaurant from most visited to least visited.
select *, rank() over(order by rating_count desc) as 'rank' from restaurants;

-- rank them based on most expensive to least
select *, rank() over(partition by city order by cost desc) as 'rank' from restaurants;

-- dense-rank every restaurant from most to least expensive as per city
-- normally ranks work like this, if there are two restau with same rank each would be given an indiviual rank like 1 to first and 2 to send
-- but in dense rank each group of rank would be given the same value, so there would be group of rank 1's 2's 
select *, dense_rank() over(partition by city order by cost desc) as 'rank' from restaurants;

-- printing both ranks side by side 
select *, rank() over(partition by city order by cost desc) as 'rank' ,
dense_rank() over(partition by city order by cost desc) as 'dense_rank' 
from restaurants;

-- same with row_number (each row will have its own rank regardless if value is same or not
select *, row_number() over(partition by city order by cost desc) as 'rank' from restaurants;

-- rank every restaurant from most to least expensive as per city along with its city [Adilabad - 1 , Adilabad - 2 ]
select *, concat(city,'-',row_number() over(partition by city order by cost desc)) as 'rank' from restaurants;

-- top 5 restaurants of every city as per their revenue
select * from (select *, cost*rating as 'revenue', row_number() over(partition by city order by rating_count*cost desc)
as 'rank' from restaurants) t where t.rank < 6;

-- top 5 restaurants based on their cuisine as per their revenue
select * from (select *, cost*rating as 'revenue', row_number() over(partition by cuisine order by rating_count*cost desc)
as 'rank' from restaurants) t where t.rank < 6;