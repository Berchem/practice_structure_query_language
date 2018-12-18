-- page 137
-- update statement
-- update table_name set column_name = value, ...;

-- page 138
update birdwatchers.humans set country_id = 'us';

use birdwatchers;

-- use of select statement to test the condition of where clause
-- before using it in the update statement
select human_id, name_first, name_last from humans
where name_first = 'Rusty' and name_last = 'Osborne';

-- page 139
update humans set name_last = 'Johnson' where human_id = 3;

select human_id, name_first, name_last
from humans where human_id = 3;

-- data lose
update humans
set formal_title = 'Ms.'
where human_id in (24, 32);

show full columns from humans like 'formal%' \G

-- the handbook show that Type: enum
-- so, modify it
--
-- +----------+--------------+
-- | human_id | formal_title |
-- +----------+--------------+
-- |        1 | Mr           |
-- |        2 | Mr           |
-- |        3 | Ms           |
-- |        4 | Ms           |
-- +----------+--------------+
-- Field: formal_title
--  Type: varchar(25)
--
-- alter table humans modify formal_title enum ('Ms.', 'Miss', 'Mr.', 'Mrs.');
-- ERROR 1265 (01000): Data truncated for column 'formal_title' at row 1
--
-- because 'Mr', 'Ms' were not in ('Ms.', 'Miss', 'Mr.', 'Mrs.')
update humans set formal_title = 'Mr.' where formal_title = 'Mr';
update humans set formal_title = 'Ms.' where formal_title = 'Ms';
alter table humans modify formal_title enum('Ms.', 'Miss', 'Mr.', 'Mrs.');

-- page 140
update humans
set formal_title = 'Ms.'
where formal_title in ('Miss', 'Mrs.');

alter table humans
change column formal_title formal_title enum ('Ms.', 'Mr.');

show warnings \G

-- page 141
alter table humans modify formal_title enum ('Ms.', 'Mr.', 'Ms', 'Mr');

update humans set formal_title = substring(formal_title, 1, 2);

alter table humans modify formal_title enum ('Mr', 'Ms');

-- page 142 limiting update
create table prize_winner (
    winner_id int auto_increment primary key,
    human_id int,
    winner_date date,
    prize_chosen varchar(255),
    prize_sent date);

-- page 143
insert into prize_winner (human_id)
select human_id from humans;

-- ordering to make different
-- If using MySQL replication, it'll have a situation in 
-- which one slave may update its data differently from the data on the master or the other slaves 
-- # especially if you use the RAND() function (i.e., the slave will have different random results)
update prize_winners
set winner_date = curdate() -- curdate(): return current date
where winner_date is null
order by rand()
limit 2;

-- page 145 updating multiple table
update prize_winners, humans
set winner_date = null,
prize_chosen = null,
prize_sent = null
where country_id = 'uk'
and prize_winners.human_id = humans.human_id;

-- ERROR 1221 (HY000): Incorrect usage of UPDATE and ORDER BY
update prize_winners, humans
set winner_date = curdate(),
where prize_chosen = null
where country_id = 'uk'
and prize_winners.human_id = humans.human_id
order by rand()
limit 2;
