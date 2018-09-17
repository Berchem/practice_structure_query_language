import pymysql.cursors


def get_connection(host, port, user, password, db, charset="utf8mb4", cursorclass=pymysql.cursors.DictCursor):

    connection = pymysql.connect(
        host=host,
        port=port,
        user=user,
        password=password,
        db=db,
        charset=charset,
        cursorclass=cursorclass
    )

    return connection
