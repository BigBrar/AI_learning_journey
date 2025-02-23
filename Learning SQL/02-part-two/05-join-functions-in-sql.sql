select * from users.users_2021;
select * from users.users_2022;
select * from users.users_2023;

-- User 2021 & 2022
select * from users.users_2021 as t_2021;
select * from users.users_2022 as t_2022;

-- will only return values that are same in both tables (INNER JOIN)
select * from users.users_2021 as t_2021 inner join users.users_2022 as t_2022 on t_2021.UserId = t_2022.UserId;

-- INNER JOIN b/w 2022 and 2023 
select * from users.users_2022 as t_2022 inner join users.users_2023 as t_2023 on t_2022.UserId = t_2023.UserId;

-- INNER JOIN b/w 2021 and 2023 
select * from users.users_2021 as t_2021 inner join users.users_2023 as t_2023 on t_2021.UserId = t_2023.UserId;

-- INNER JOIN b/w 2021, 2022 and 2023
select * from users.users_2021 as t_2021 inner join users.users_2022 as t_2022 on t_2021.UserId = t_2022.UserId
inner join users.users_2023 as t_2023 on t_2023.UserID = t_2021.UserID;

-- Left Join: will contain all the values of the left table and only matching values from the right one
select * from users.users_2021 as t_2021 left join users.users_2022 as t_2022 on t_2021.UserId = t_2022.UserId;
select * from users.users_2023 as t_2023 left join users.users_2021 as t_2021 on t_2023.UserId = t_2021.UserId;

-- Right join: opposite of the left join
select * from users.users_2021 as t_2021 right join users.users_2022 as t_2022 on t_2021.UserId = t_2022.UserId;
select * from users.users_2023 as t_2023 right join users.users_2021 as t_2021 on t_2023.UserId = t_2021.UserId;

-- cross inner join : in order to use both joins at once.
select * from users.users_2021 as t_2021 left join users.users_2022 as t_2022 on t_2021.UserId = t_2022.UserId 
union
select * from users.users_2021 as t_2021 right join users.users_2022 as t_2022 on t_2021.UserId = t_2022.UserId;