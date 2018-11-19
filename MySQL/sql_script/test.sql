use test;

drop table if exists memo;

create table if not exists memo (
	date datetime,
	time timestamp,
	event text,
	note text
)character set utf8;

