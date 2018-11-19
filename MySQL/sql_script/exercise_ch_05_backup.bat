# dumping specify database to the file
mysqldump --user='admin' -p rookery > d:\rookery.sql

# reloading the dump file to the specify database
mysql --user='admin' -p rookery < d:\rookery.sql
