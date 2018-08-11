import json

# create a table in SQL
#
# create table users (
#     user_id int not null,
#     name varchar(200),
#     num_friends int
# );
#
# insert into users (user_id, name, num_friends) values (0, "Hero", 0);


class Table:
    def __init__(self, columns):
        self.columns = columns
        self.rows = []

    def __repr__(self):
        return str(self.columns) + "\n" + "\n".join(map(str, self.rows))

    def insert(self, row_values):
        if len(row_values) != len(self.columns):
            raise TypeError("wrong number of elements")

        self.rows += [dict(zip(self.columns, row_values))]


with open("user.json") as f:
    users = json.load(f)

tb1 = Table(["user_id", "name", "num_friends"])
tb1.insert(users[1])

print tb1
