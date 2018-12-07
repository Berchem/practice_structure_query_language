-- the insert query:
-- INSERT INTO table [(column, ...)]
--     VALUES (value, ...), (...), ...;

use test;

drop table if exists books;
create table books (
    title text,
    author text,
    year text);

insert into books
values ('The Big Sleep', 'Raymond Chandler', '1934');

insert into books
values ('The Thirty-Nine Steps', 'John Buchan', default);

insert into books
(author, title)
values ('Evelyn Waugh', 'Brideshead Revisited');

insert into books
(title, author, year)
values
('Visitation of Spirts', 'Randall Kenan', '1989'),
('Heart of Darkness', 'Joseph Conrad', '1902'),
('The Idiot', 'Fyodor Dostoevsky', '1871');

-- select * from books;

use rookery;

drop table if exists bird_orders;
create table bird_orders (
    order_id int auto_increment primary key,
    scientific_name varchar(255) unique,
    brief_description text,
    order_image blob
) default charset=utf8 collate=utf8_general_ci;

describe bird_orders;

alter table bird_orders
auto_increment = 100;

INSERT INTO bird_orders
(scientific_name, brief_description)
VALUES
('Anseriformes', 'Waterfowl'),
('Galliformes', 'Fowl'),
('Charadriiformes', 'Gulls, Button Quails, Plovers'),
('Gaviiformes', 'Loons'),
('Podicipediformes', 'Grebes'),
('Procellariiformes', 'Albatrosses, Petrels'),
('Sphenisciformes', 'Penguins'),
('Pelecaniformes', 'Pelicans'),
('Phaethontiformes', 'Tropicbirds'),
('Ciconiiformes', 'Storks'),
('Cathartiformes', 'New-World Vultures'),
('Phoenicopteriformes', 'Flamingos'),
('Falconiformes', 'Falcons, Eagles, Hawks'),
('Gruiformes', 'Cranes'),
('Pteroclidiformes', 'Sandgrouse'),
('Columbiformes', 'Doves and Pigeons'),
('Psittaciformes', 'Parrots'),
('Cuculiformes', 'Cuckoos and Turacos'),
('Opisthocomiformes', 'Hoatzin'),
('Strigiformes', 'Owls'),
('Struthioniformes', 'Ostriches, Emus, Kiwis'),
('Tinamiformes', 'Tinamous'),
('Caprimulgiformes', 'Nightjars'),
('Apodiformes', 'Swifts and Hummingbirds'),
('Coraciiformes', 'Kingfishers'),
('Piciformes', 'Woodpeckers'),
('Trogoniformes', 'Trogons'),
('Coliiformes', 'Mousebirds'),
('Passeriformes', 'Passerines');

describe bird_families;

select order_id from bird_orders
where scientific_name = 'Gaviiformes';

insert into bird_families
values (100, 'Gaviidae',
'Loons or divers are aquatic birds found mainly in the Northern Hemisphere.',
103);

-- the followinh query would throw error not warning
-- so the family_id won't auto increment
-- insert into bird_families
-- values ('Anatidae',
-- 'This family includes ducks, geese and swans.', null, 103);

insert into bird_families
values (101, 'Anatidae',
'This family includes ducks, geese and swans.', 103);

show warnings \G

delete from bird_families
where family_id = 101;

insert into bird_families
(scientific_name, order_id, brief_description)
values ('Anatidae', 103, 'This family includes ducks, geese and swans.');

select * from bird_families \G

select order_id, scientific_name from bird_orders;

insert into bird_families
(scientific_name, order_id)
values
('Charadriidae', 109),
('Laridae', 102),
('Sternidae', 102),
('Caprimulgidae', 122),
('Sittidae', 128),
('Picidae', 125),
('Accipitridae', 112),
('Tyrannidae', 128),
('Formicariidae', 128),
('Laniidae', 128);

select family_id, scientific_name
from bird_families
order by scientific_name;

show columns from birds;

show columns from birds like '%id';

show full columns from birds;

alter table birds
modify column conservation_status_id int default 8;

insert into birds
(common_name, scientific_name, family_id)
values ('Mountain Plover', 'Charadrius montanus', 103);

insert into birds
(common_name, scientific_name, family_id)
values
('Snowy Plover', 'Charadrius alexandrinus', 103),
('Black-bellied Plover', 'Pluvialis squatarola', 103),
('Pacific Golden Plover', 'Pluvialis fulva', 103);

select common_name as 'bird',
    birds.scientific_name as 'Scientific Name',
    bird_families.scientific_name as 'Family',
    bird_orders.scientific_name as 'Order'
from birds,
    bird_families,
    bird_orders
where birds.family_id = bird_families.family_id
and bird_families.order_id = bird_orders.order_id;

insert into bird_families
set scientific_name = 'Rallidae',
order_id = 113;

-- inserting data from another table
drop table if exists cornell_birds_families_orders;
create table cornell_birds_families_orders (
    fid int auto_increment primary key,
    bird_family varchar(255),
    examples varchar(255),
    bird_order varchar(255));

describe cornell_birds_families_orders;

select * from cornell_birds_families_orders limit 1;

alter table bird_families
add column cornell_bird_order varchar(255);

insert ignore into bird_families
(scientific_name, brief_description, cornell_bird_order)
select bird_family, examples, bird_order
from cornell_birds_families_orders;

select * from bird_families
order by family_id desc limit 1;

-- page 107
select distinct bird_orders.order_id,
cornell_bird_order as "Cornell's order",
bird_orders.scientific_name as 'My order'
from bird_families, bird_orders
where bird_families.order_id is null
and cornell_bird_order = bird_orders.scientific_name
limit 5;

-- page 109
update bird_families, bird_orders
SET bird_families.order_id = bird_orders.order_id
where bird_families.order_id is null
AND cornell_bird_order = bird_orders.scientific_name;

select * from bird_families
order by family_id desc limit 4;

select * from bird_orders where order_id = 128;
-- output >>
-- +----------+-----------------+-------------------+-------------+
-- | order_id | scientific_name | brief_description | order_image |
-- +----------+-----------------+-------------------+-------------+
-- |      128 | Passeriformes   | Passerines        | NULL        |
-- +----------+-----------------+-------------------+-------------+
-- Passeriformes 雀形目

-- page 110 check which items were unmatched
select family_id, scientific_name, brief_description
from bird_families where order_id is null;

-- update order
update bird_families
set order_id = 112
where cornell_bird_order = 'Accipitriformes';

-- page 111
alter table bird_families
drop column cornell_bird_order;

-- drop table cornell_birds_families_orders;

-- page 112 replacing data
replace into bird_families
(scientific_name, brief_description, order_id)
values
('Viduidae', 'Indigobirds & Whydahs', 128),
('Estrildidae', 'Waxbills, Weaver Finches, & Allies', 128),
('Ploceidae', 'Weavers, Malimbe, & Bishops', 128);

select * from bird_families
where scientific_name = 'Viduidae' \G

-- page 113
-- statements that change data (insert, update, delete)
-- take the priority over read statements (select)
-- write > read

-- page 114
-- [lowering the priority of an insert]
-- insert low_priority into bird_sightings ...

-- page 115
-- [delaying an insert]
-- insert delayed into bird_sightings ...

-- [raising an priority of an insert]
-- insert high_priority into bird_sightings ...

-- page 116
-- INSERT statements by default are usually
-- given higher priority over read-only SQL statements
-- so there would seem to be no need for this option

-- create table test121 (id int auto_increment primary key, name varchar(10));
-- insert low_priority into test121 (name) values ('Hero');
-- insert into test121 (name) values ('Clive');
