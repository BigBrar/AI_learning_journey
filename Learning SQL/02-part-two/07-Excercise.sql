select * from users.users_2021;
select * from users.users_2022;
select * from users.users_2023;


-- 1. List the new users added in 2022
select * from users.users_2022 except select * from users.users_2021;

-- 2. List hte new users added in 2023
select * from users.users_2023 except select * from users.users_2022;

-- 3. List the users who left us
select * from users.users_2021 except select * from users.users_2022 except select * from users.users_2023;

-- 4. List all the users that are there throghout the database for year 2021 & 2022
select * from users.users_2021 union select * from users.users_2022;

-- 5. List all the users that are there throughout the database
select * from users.users_2021 union select * from users.users_2022 union select * from users.users_2023;

-- 6. List the users that are there with us from last 3 years
select * from users.users_2021 intersect select * from users.users_2022 intersect select * from users.users_2023;

-- 7. List all the users except that users who are there with us from 3 years
select * from users.users_2021 union select * from users.users_2022 union select * from users.users_2023
except
select * from users.users_2021 intersect select * from users.users_2022 intersect select * from users.users_2023;

-- 8. 