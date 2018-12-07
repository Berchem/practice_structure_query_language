-- exercise 1
drop table if exists bird_orders;
create table bird_orders (
    order_id int auto_increment primary key,
    scientific_name varchar(255) unique,
    brief_description text,
    order_image blob
) default charset=utf8 collate=utf8_general_ci;
describe bird_orders;

-- exercise 2
drop table if exists birds_wing_shapes;
create table birds_wing_shapes (
    wing_id char(2) unique,
    wing_shape char(25),
    wing_example blob
)engine=myisam charset=utf8 collate=utf8_general_ci;

-- exercise 3
show create table birds_wing_shapes;
show create table birds_wing_shapes \G

-- exercise 4
drop table if exists birds_body_shapes;
create table birds_body_shapes (
    body_id char(3) unique,
    body_shape char(25),
    body_example blob
)engine=myisam charset=utf8 collate=utf8_general_ci;

drop table if exists birds_bill_shapes;
create table birds_bill_shapes (
    bill_id char(2) unique,
    bill_shape char(25),
    bill_example blob
)engine=myisam charset=utf8 collate=utf8_general_ci;

show create table birds_body_shapes \G
show create table birds_bill_shapes \G

-- create
create table tablename (a int);
