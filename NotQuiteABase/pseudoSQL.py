import json


# create a table in SQL
class Table:
    def __init__(self, columns):
        """CREATE TABLE

        create table users (
            user_id int not null,
            name varchar(200),
            num_friends int
        );

        :param columns: [column_values]
        """
        self.columns = columns
        self.rows = []

    def __repr__(self):
        return str(self.columns) + "\n" + "\n".join(map(str, self.rows))

    def insert(self, row_values):
        """INSERT INTO

        insert into users (user_id, name, num_friends) values (0, "Hero", 0);

        :param row_values: [row_values]
        :return: void
        """
        if len(row_values) != len(self.columns):
            raise TypeError("wrong number of elements")

        self.rows += [dict(zip(self.columns, row_values))]

    def update(self, updates, predicate):
        """UPDATE

        update users
        set num_friends = 1
        where user_id = 0;

        :param updates: {column: new_value}
        :param predicate: boolean function, f({key: value})
        :return:
        """
        for row in self.rows:
            if predicate(row):
                for column, new_value in updates.iteritems():
                    row[column] = new_value

    def delete(self, predicate=lambda row: True):
        """DELETE

        :param predicate: boolean function, f({key: value}) 
        :return:
        """
        self.rows = [row for row in self.rows if not predicate(row)]


# read data
with open("user.json") as f:
    data = json.load(f)

# create table users
users = Table(["user_id", "name", "num_friends"])

# insert data into table
for user in data:
    users.insert(user)

# # update user_id=0, num_friend -> 1
# users.update({"num_friends": 1}, lambda row: row["user_id"] == 0)
#
# # update name="Chi", num_friend -> 10
# users.update({"num_friends": 10}, lambda row: row["name"] == "Chi")
#
# # delete user_id=1
# users.delete(lambda row: row["user_id"] == 1)
#
# # delete all
# users.delete()

print users
