-- exercise 1
-- switch database
use test;
-- clear table
drop table if exists contacts, relation_types;
-- creat table contacts
create table contacts (
    name text,
    phone_work text,
    phone_mobile text,
    email text,
    relation_id int);
-- create table relation_types
create table relation_types (
    relation_id int,
    relation_types char(9));
-- after create, use of 'describe' commend to view table
describe contacts;
describe relation_types;

-- exercise 2
-- insert records to relation_types
insert into relation_types values
	(1, 'Family'),
	(2, 'Friend'),
	(3, 'Colleague');
-- insert records to contacts
insert into contacts values 
	('Hero', '02-2709-1229', '0911-862-475', 'low118profile@gmail.com', 2),
	('Dunn', '02-6631-6593', '0911-476-771', 'nico.lai@iii.edu.tw', 2),
	('Sue', '02-2343-4555', '0907-634-410', 'de_info@yahoo.com.tw', 3),
	('Chi', '02-2657-8247', '0926-409-587', 'jocelyn_chen@outlook.com', 3),
	('Thor', '02-7720-1182', '0919-250-172', 'andrea928@gmail.com', 1),
	('Clive', '02-2345-6789', '0980-847-830', 'tutorABC@hotmail.com', 3);

-- exercise 3
-- execute select all records from two tables
select * from contacts;
select * from relation_types;
-- execute select to view name & email only from contacts table
select name, email from contacts;

-- exercise 4
-- update some name & or phone number
update contacts set name='Devin' where name='Clive';
update contacts set phone_mobile='0921-974-969' where name='Thor';
-- update email & relation_id in one commend
update contacts set email='jocelyn.chen@gmail.com', relation_id=2 where name='Chi';

-- exercise 5
select name, phone_mobile
from contacts
join relation_types on contacts.relation_id=relation_types.relation_id
where contacts.relation_id=2;
