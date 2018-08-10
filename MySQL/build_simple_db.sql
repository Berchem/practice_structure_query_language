# first log into MySQL, create a database
create database scraping;

# specify a database to interact
use scraping;

# create a table. a table in MySQL can't exist without columns
create table pages(
	id bigint(7) not null auto_increment,
    title varchar(200),
    content varchar(10000),
    created timestamp default current_timestamp,
    primary key (id)
);

# drop table
drop table pages;

# insert some data to table
insert into pages(title, content) values (
	"test page title",
    "this is some test page content. it can be up to 10000 characters longs"
);

# override default (auto_increment, current_timestamp)
insert into pages (id, title, content, created) values (
	3,
    "test page title",
    "content",
    "1991-01-18 11:46:30"
);

select * from pages where id = 2;