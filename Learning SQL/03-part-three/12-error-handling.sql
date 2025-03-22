-- exception handling 



-- if table doesn't exist 

drop procedure if exists handle_non_existant_table;
delimiter //
create procedure handle_non_existant_table()
	begin
		declare continue handler for SQLEXCEPTION
			begin
				select 'The table "non_existant_table" does not exist' as message;
			end;
		select * from non_existant_table;
	end //
delimiter ;
call handle_non_existant_table();


-- 