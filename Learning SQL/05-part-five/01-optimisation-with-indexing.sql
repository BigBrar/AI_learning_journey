use restau;

select * from restaurants ;

describe restaurants;

-- here without fulltext indexing the query response time is 0.203 OR 0.126 seconds
SELECT * FROM restaurants WHERE (city LIKE '%bangalo%' and name like '%point%' );
-- select * from restaurants;

-- fulltext index 
drop index idx_city on restaurants;
create fulltext index idx_city on restaurants(city,name);


-- here after indexing the query execution time is 0.078 seconds
SELECT * FROM restaurants WHERE (city LIKE '%bangalo%' and name like '%point%');