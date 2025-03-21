-- select all columns from 'restaurants' with alias 'r'
select * from restaurants as r;

-- select the city, average cost in each city using table aliash
select r.city, avg(r.cost) from restaurants as r group by r.city;

-- select restaus that have higher than the average rating of all restaurants int same city using self-referencing query
select r.* from restaurants as r where r.rating > (select avg(rating) from restaurants where city = r.city);