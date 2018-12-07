-- exercise 1
use rookery;

alter table birds_details
add column migrate int,
add column bird_feeder int not null,
change column description bird_description text;

-- exercise 2
create table habitat_codes (
    habitat_id int auto_increment primary key,
    habitat varchar(25));

insert into habitat_codes
    (habitat)
values
    ('Coasts'),
    ('Deserts'),
    ('Forests'),
    ('Grasslands'),
    ('Lakes, Rivers, Ponds'),
    ('Marshes, Swamps'),
    ('Mountains'),
    ('Oceans'),
    ('Urban');

select * from habitat_codes;

create table bird_habitats (
    bird_id int,
    habitat_id int);

describe bird_habitats;

rename table bird_habitats to birds_habitats;

-- exercise 3
alter table birds_habitats
add unique birds_habitats (bird_id, habitat_id);


select bird_id, common_name from birds;

select * from habitat_codes;

insert into birds_habitats
    (bird_id, habitat_id)
values
    (2, 5),
    (3, 6),
    (4, 3);

-- exercise 4
alter table birds_habitats
drop index birds_habitats,
add unique bird_habitat (bird_id, habitat_id);

-- exercise 5
alter table birdwatchers.humans
add column country_id char(2),
add column menbership_type enum ('basic', 'premium') not null,
add column menbership_expiration date;