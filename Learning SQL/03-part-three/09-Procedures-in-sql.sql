select * from messy_indian_dataset;

-- creating your first procedure 
drop procedure if exists GetUserById;
delimiter // 
create procedure GetUserById(IN userID INT)
begin
	select * from messy_indian_dataset where id = userID;
end //
delimiter ;
call GetUserById(1);

-- procedure to change purchase amount 
drop procedure if exists UpdatePurchaseAmount;
delimiter // 
create procedure UpdatePurchaseAmount(IN newPurchaseAmount INT)
begin
	update messy_indian_dataset
		set purchase_amount = newPurchaseAmount;
        select * from messy_indian_dataset;
end //
delimiter ;
call UpdatePurchaseAmount(1200);