import mysql.connector

connection = mysql.connector.connect(
    user='root', password='', host='myubuntu', port="3306", database='db2'
)
print("DB2 connected python")

cursor = connection.cursor()
cursor.execute('Select * FROM recordLabel')
recordLabel = cursor.fetchall()

print(recordLabel)
