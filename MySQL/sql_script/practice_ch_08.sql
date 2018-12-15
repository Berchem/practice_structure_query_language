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
