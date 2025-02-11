drop table if exists deep;

create table deep (id INT, name VARCHAR(50), age INT, department VARCHAR(50));

select * from deep;

-- altering the table by adding new columns
alter table deep add column mail varchar(50);
select * from deep;

-- renaming the columns 
alter table deep rename column id to gigachad_id;
select * from deep;

-- adding column with default value 
alter table deep add column marital_status varchar(50) DEFAULT 'Unknown';
select * from deep;
-- this is not working for some reason, idk why but it's not working

-- deleting the newly added column
alter table deep drop column mail;
select * from deep;
