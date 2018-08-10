# first log into MySQL, create a database
create database practice;

# specify a database to interact
use practice;

# create a table. a table in MySQL can't exist without columns
create table test(
	id int(4) not null auto_increment,
    lable1 varchar(20),
    usr_name varchar(50),
    log timestamp default current_timestamp,
    primary key (id)
);
