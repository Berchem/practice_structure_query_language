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

-- select * from bird_families
-- where scientific_name
-- in ('Charadriidae', 'Haematopodidae', 'Recurvirostridae', 'Scolopacidae');
select * from bird_families
where scientific_name like 'Charadriidae%'
or scientific_name like 'Haematopodidae%'
or scientific_name like 'Recurvirostridae%'
or scientific_name like 'Scolopacidae%';

-- page 123
select common_name, scientific_name, family_id
from birds
where family_id in (103, 160, 162, 164)
order by common_name
limit 3;


