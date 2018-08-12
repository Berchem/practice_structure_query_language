import json
from pseudoSQL import Table

# read data
with open("user.json") as f:
    data = json.load(f)

# create table users
users = Table(["user_id", "name", "num_friends"], )

# insert data into table
for user in data:
    users.insert(user)

# update user_id=0, num_friend -> 1
users.update({"num_friends": 1}, lambda row: row["user_id"] == 0)

# update name="Chi", num_friend -> 10
users.update({"num_friends": 10}, lambda row: row["name"] == "Chi")

# delete user_id=1
users.delete(lambda row: row["user_id"] == 1)

# delete all
# users.delete()

# select * from users
s1 = users.select()

# select name, num_friends from users
s1 = users.select(keep_columns=["name", "num_friends"])

# select length(name) as name_length from users
s1 = users.select(keep_columns=["user_id"],
                  additional_columns={"name_len": lambda row: len(row["name"])})

# select num_friends > 2 as fs>2 from users
s2 = users.select(None, {"fs>2": lambda row: row["num_friends"] > 2})

# select * from users limit 2
# l1 = users.limit(3)
l1 = users.select().limit(2)

# select * from users where num_friends > 1
w1 = users.where(lambda row: row["num_friends"] > 1)

# select name, num_friends where num_friend < 1
w1 = users.select(["name", "num_friends"]).where(lambda row: row["num_friends"] < 1)


# g1 = users.group_by(group_by_columns=["num_friends"])

# select * from users
# order by name
o1 = users.order_by(lambda row: row["name"])

print users
print o1
