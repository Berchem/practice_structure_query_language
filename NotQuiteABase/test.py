import json
from pseudoSQL import Table


with open("../test_data/user.json") as f:
    data = json.load(f)

# create table
users = Table(["id", "name", "friends"])

# INSERT INTO
for user in data:
    users.insert(user)

with open("../test_data/interests.json") as f:
    data = json.load(f)

interests = Table(["id", "interests"])

for interest in data:
    interests.insert(interest)

usr_interest = users.join(interests, 1)

print usr_interest
