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

select common_name, scientific_name, family_id
from birds
where family_id in (103, 160, 162, 164)
and common_name != ''
order by common_name
limit 3;

select common_name, scientific_name, family_id
from birds
where family_id in (103, 160, 162, 164) and common_name != ''
order by common_name
limit 3, 2;

-- page 125
select common_name as 'Bird',
bird_families.scientific_name as 'Family'
from birds, bird_families
where bird_families.family_id = birds.family_id
and order_id = 102
and common_name != ''
order by common_name limit 10;

-- page 126
select common_name as 'Bird',
families.scientific_name as 'Family'
from birds, bird_families as families
where families.family_id = birds.family_id
and order_id = 102
and common_name != ''
order by common_name limit 10;

-- page 127
select common_name as 'Bird',
families.scientific_name as 'Family',
orders.scientific_name as 'Order'
from birds,
bird_families as families,
bird_orders as orders
where birds.family_id = families.family_id
and families.order_id = orders.order_id
and families.order_id = 102
and common_name != ''
order by common_name limit 10, 5;

-- page 128 use of like in where statement
select common_name as 'Bird',
families.scientific_name as 'Family',
orders.scientific_name as 'Order'
from birds,
bird_families as families,
bird_orders as orders
where birds.family_id = families.family_id
and families.order_id = orders.order_id
-- and families.order_id = 102
 and common_name like '%Plover'
order by orders.scientific_name, families.scientific_name, common_name
limit 10;

-- build test.birds_prime using cornell data

-- page 129
select common_name as 'Birds Great and Small'
from test.birds_prime
where common_name regexp 'Great|Least'
order by common_name limit 10;

select common_name as 'Birds Great and Small'
from test.birds_prime
where common_name regexp 'Great|Least'
and common_name not regexp 'Greater'
order by common_name limit 10;

-- page 130
select common_name as 'Hawks' from test.birds_prime
where common_name regexp 'Hawk'
and common_name not regexp 'Hawk-Owl'
order by family_id limit 10;

-- counting results
select count(*) from test.birds_prime;

select 
  families.scientific_name as 'Family',
  count(*) 'Number of birds'
from test.birds_prime, bird_families as families
where test.birds_prime.family_id = families.family_id
and families.scientific_name = 'Pelecanidae';

