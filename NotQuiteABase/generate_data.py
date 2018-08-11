import json

# users data
# ["id", "user name", "number of friends"]
users = [
    [0, "Hero", 0],
    [1, "Dunn", 2],
    [2, "Sue", 3],
    [3, "Chi", 3]
]
with open("user.json", "w") as f:
    json.dump(users, f, indent=4)
