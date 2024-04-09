import mysql.connector

connection = mysql.connector.connect(
    user='tom', password='', host='mysql', port="3306", database='db2'
)
print("DB2 connected python2 as tom")

cursor = connection.cursor()
cursor.execute('Select * FROM song')
song = cursor.fetchall()

print(song)
