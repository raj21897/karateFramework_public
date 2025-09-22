Feature: Test run query

  Background:
    * def query = "select * from students where student_id = 1 "

  Scenario:
    * def dbconn = call read('classpath:features/database/dbconnect.feature'){ query: '#(query)' }
    * print dbconn
    * print dbconn.result[0]
    * def dbqueriess = Java.type('utils.DbQueries')
    * def query = dbqueriess.getAllActiveStudents()
    * def dbconn = call read('classpath:features/database/dbconnect.feature'){ query: '#(query)' }
    * print dbconn
    * print dbconn.result[0]
