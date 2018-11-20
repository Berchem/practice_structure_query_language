use rookery;
-- alter table bird_families
-- add column order_id int;
-- describe bird_families;

-- copy table with schema
drop table if exists test.birds_new;
create table if not exists test.birds_new like birds;
insert into test.birds_new
select * from birds;
describe test.birds_new;

-- copy table without schema
create table if not exists test.birds_alternative
select * from birds;
describe test.birds_alternative;
drop table if exists test.birds_alternative;

-- change database
use test;

-- add column without specify position
alter table birds_new
add column wing_id char(2);

describe birds_new;

-- delete column
alter table birds_new
drop column wing_id;

-- add column with specify position
alter table birds_new
add column wing_id char(2) after family_id;

describe birds_new;

-- multi-alternative: add multi column, add column with default, change column type
alter table birds_new
add column body_id char(2) after wing_id,
add column bill_id char(2) after body_id,
add column endangered bit default b'1' after bill_id,
change column common_name common_name varchar(255);

describe birds_new;


update birds_new set endangered=0 where bird_id in (1, 2, 4, 5);