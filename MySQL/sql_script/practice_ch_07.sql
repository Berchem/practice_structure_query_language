-- page 120 select statement
-- SELECT column FROM table;
use rookery;

select * from birds;

select bird_id, scientific_name, common_name from birds;

-- page 121 selecting by a criteria
select common_name, scientific_name
from birds
where family_id = 103
limit 3;

-- page 122 ordering result
select common_name, scientific_name
from birds where family_id = 103
order by common_name
limit 3;


