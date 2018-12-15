-- exercise 1
use test;

select common_name as Bird from birds_prime
where common_name like '%Pigeon';

select common_name as Bird from birds_prime
where common_name like '%Pigeon' limit 10;

select common_name as Bird from birds_prime
where common_name like '%Pigeon' limit 10, 10;

-- exercise 2
use rookery;
select
  scientific_name as 'Order',
  brief_description as 'Type of Birds in Order'
from bird_orders;

select
  common_name as 'Common Name of Bird',
  scientific_name as 'Scientific Name of Bird'
from test.birds_prime limit 25;

select
  birds.common_name as 'Common Name of Bird',
  birds.scientific_name as 'Scientific Name of Bird',
  orders.scientific_name as 'orders',
  orders.brief_description as 'Type of Birds in Order'
from
  test.birds_prime as birds,
  bird_orders as orders
where birds.scientific_name = orders.scientific_name
and common_name != null
limit 25;

-- exercise 3
select common_name as 'Type of Columbidae' from test.birds_prime
where common_name regexp 'Pigeon|Dove';