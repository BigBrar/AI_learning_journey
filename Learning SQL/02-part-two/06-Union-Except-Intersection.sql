select * from users.users_2021;
select * from users.users_2022;
select * from users.users_2023;

-- UNION - join two queries and not repeat duplicates within them
select * from users.users_2021 union select * from users.users_2022;
select * from users.users_2022 union select * from users.users_2023;
select * from users.users_2021 union select * from users.users_2022 union select * from users.users_2023;

-- UNION ALL - works just like UNION but does duplicates stay as they are & get repeated.
select * from users.users_2021 union all select * from users.users_2022;
select * from users.users_2021 union all select * from users.users_2022 union all select * from users.users_2023;
-- this contains both UNION ALL and UNION so no duplicates
(select * from users.users_2021 union all select * from users.users_2022) union select * from users.users_2023;

-- EXCEPT - prints the unique values of table1 that are not there in table2
select * from users.users_2021 except select * from users.users_2022;
select * from users.users_2022 except select * from users.users_2021;

-- INTERSECT - returns the values that are common in all tables.
select * from users.users_2021 intersect select * from users.users_2022;