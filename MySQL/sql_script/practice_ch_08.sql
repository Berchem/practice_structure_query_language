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

