create database temporary;
show databases;
use temporary;

create table account(
id int primary key,
fullname varchar(50) unique,
balance int not null default 0
);

select * from account;

-- add new coloumn
ALTER TABLE account ADD interest FLOAT NOT NULL DEFAULT 0;

-- modify datatype
ALTER TABLE  account MODIFY interest DOUBLE NOT NULL DEFAULT 0;
ALTER TABLE  account MODIFY interest float NOT NULL DEFAULT 0;
-- describe attributes
desc account;

-- rename col
ALTER TABLE account
CHANGE COLUMN 
interest saving_interest FLOAT NOT NULL DEFAULT 0;

-- drop column
ALTER TABLE account DROP column saving_interest;

-- rename table
ALTER TABLE account RENAME to account_details;

select * from account_details;