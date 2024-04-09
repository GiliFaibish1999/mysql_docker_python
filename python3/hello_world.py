import mysql.connector

connection = mysql.connector.connect(
    user='zoe', password='', host='myubuntu', port="3306", database='db3'
)
print("DB3 connected python3 as zoe")

cursor = connection.cursor()
cursor.execute('Select * FROM bookings')
bookings = cursor.fetchall()

print(bookings)