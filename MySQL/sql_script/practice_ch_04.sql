drop database if exists rookery;
drop database if exists birdwatchers;

create database rookery
    character set latin1
    collate latin1_bin;

show databases;

use rookery;

create table birds (
    bird_id int auto_increment primary key,
    scientific_name varchar(255) unique,
    common_name varchar(255),
    family_id int,
    description text);
    
describe birds;

insert into birds
    (scientific_name, common_name)
values
    ('Charadrius vociferus', 'Killdeer'),
    ('Gavia immer', 'Great Northern Loon'),
    ('Aix sponsa', 'Wood Duk'),
    ('Chordeiles minor', 'Common Nighthawk'),
    ('Sitta carolinensis', 'White-breasted Nuthatch'),
    ('Apteryx mantelli', 'North Island Brown Kiwi');
select * from birds;

create database birdwatchers;
create table birdwatchers.humans (
    human_id int auto_increment primary key,
    formal_title varchar(25),
    name_first varchar(25),
    name_last varchar(25),
    email_address varchar(255));
insert into birdwatchers.humans
    (formal_title, name_first, name_last, email_address)
values
    ('Mr', 'Russell', 'Dyer', 'russell@sqlresources.com'),
    ('Mr', 'Richard', 'Stringer', 'richard@sqlresources.com'),
    ('Ms', 'Rusty', 'Osborne', 'rusty@sqlresources.com'),
    ('Ms', 'Lexi', 'Hollar', 'alexandra@sqlresources.com');
select * from birdwatchers.humans;

-- use birds;
create table bird_families (
    family_id int auto_increment primary key,
    scientific_name varchar(255) unique,
    brief_description varchar(255));
describe bird_families;

create table bird_orders (
    order_id int auto_increment primary key,
    scientific_name varchar(255) unique,
    brief_description varchar(255),
    order_image blob
) default charset=utf8 collate=utf8_general_ci;
show create table bird_orders;
