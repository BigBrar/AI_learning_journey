use restau;

select * from messy_indian_dataset;

-- start a transaction
start transaction;
update messy_indian_dataset set purchase_amount = 1500 where id = 1;
select * from messy_indian_dataset;

-- rollback from a transaction
start transaction;
update messy_indian_dataset set purchase_amount = 1400 where id = 1;
select * from messy_indian_dataset;
rollback; -- return back to the earlier value discarding current changes.
select * from messy_indian_dataset;


-- transaction with commit 
start transaction;
update messy_indian_dataset set purchase_amount = 1400 where id = 1;
select * from messy_indian_dataset;
commit; -- make the changes permanent
select * from messy_indian_dataset;


-- commit & rollback
start transaction;
insert into messy_indian_dataset (id, name, age, gender, email, phone_number, city, state, purchase_amount, purchase_date)
values (11, 'Mahesh Jatel', 69, 'Male', 'rajesh@example.com', '9876543210', 'Mumbai', 'Maharashtra', 1000.50, '2023-01-05');
select * from messy_indian_dataset where id = 11;
select * from messy_indian_dataset;
commit;
rollback; -- this won't work since we've already commited and made changes permanent
select * from messy_indian_dataset;


