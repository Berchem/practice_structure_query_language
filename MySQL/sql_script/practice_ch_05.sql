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

-- i don't know why ERROR 1265 (01000): Data truncated for column 'endangered' at row 1
-- so drop column then add a new one
alter table birds_new drop column endangered;

alter table birds_new
add column endangered
enum ('Extinct',
    'Extinct in Wild',
    'Threathend - Critically Endangered',
    'Threatened - Endengered',
    'Threatened - Vulnerable',
    'Lower Risk - Conservation Dependent',
    'Lower Risk - Mear Threatened',
    'Lower Risk - Least Concern') not null
after family_id;

describe birds_new;

-- create table rookery.conservation_status
drop table if exists rookery.conservation_status;
create table rookery.conservation_status (
    status_id int auto_increment primary key,
    conservation_category char(10),
    conservation_state char(25));

-- insert data
insert into rookery.conservation_status
    (conservation_category, conservation_state)
values
    ('Extinct', 'Extinct'),
    ('Extinct', 'Extinct in Wild'),
    ('Threathend', 'Critically Endangered'),
    ('Threathend', 'Endengered'),
    ('Threathend', 'Vulnerable'),
    ('Lower Risk', 'Conservation Dependent'),
    ('Lower Risk', 'Mear Threatened'),
    ('Lower Risk', 'Least Concern');

-- query the table
select * from rookery.conservation_status;

-- notice: database `test` is still in used
-- alter column name and alter default
alter table birds_new
change column endangered conservation_status_id int default 8;

describe birds_new;

-- alter default setting
alter table birds_new
alter column conservation_status_id set default 7;

show columns from birds_new like 'conservation_status_id' \G

alter table birds_new
alter column conservation_status_id drop default;

show columns from birds_new like 'conservation_status_id' \G

select auto_increment
from information_schema.tables
where table_name='birds';

-- alter the table's auto_increment
alter table rookery.birds auto_increment = 10;
alter table rookery.birds auto_increment = 7;

use rookery;

drop table if exists birds_new;
create table birds_new like birds;
-- alter table birds_new auto_increment = 7;
insert into birds_new
select * from birds;

drop table if exists birds_details;
create table birds_details
select bird_id, description from birds;

alter table birds
drop column description;

rename table rookery.birds to rookery.birds_old,
test.birds_new to rookery.birds;

show tables in rookery like 'bird%';

-- alter table test.country order by code;
select * from test.country order by code limit 5;
select * from test.country order by countryname limit 5;

-- the following command would throw error 1068
alter table conservation_status
change status_id conservation_status_id int auto_increment primary key;

explain select * from birdwatchers.humans
where name_last = 'Hollar' \G

-- add index
-- key name: human_names
-- columns: name_first, name_last
alter table birdwatchers.humans
add index human_names (name_last, name_first);

show create table birdwatchers.humans \G

show index from birdwatchers.humans
where key_name = 'human_names' \G

alter table conservation_status
drop primary key,
change status_id conservation_status_id int primary key auto_increment;