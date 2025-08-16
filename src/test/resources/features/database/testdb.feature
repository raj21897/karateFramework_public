#Feature: Use DB Connection from another feature
#
#  Background:
#    # Call dbconnect.feature ONCE
#    * def dbInit = callonce read('classpath:features/database/dbconnect.feature')
#    # Optional: use conn from return value if not static
#    * def conn = dbInit.conn
#    * def DbUtils = Java.type('utils.DbUtils')
#
#  Scenario: Run query using DbUtils
#    * def rs = DbUtils.executeQuery("SELECT * FROM STUDENTS")
#    * def result = DbUtils.rows(rs)
#    * print result
#
Feature: Validate student API data against DB

  Background:
    * def DbQueries = karate.get('DbQueries')

  Scenario: Validate student by ID
  # Call the API
#    Given url baseUrl + '/students/1'
#    When method get
#    Then status 200
#    * def apiStudent = response

  # Call the DB Connect feature with query
    * def query = DbQueries.getStudentById(1)
    * def dbCall = call read('dbConnect.feature') { query: '#(query)' }
    * def dbStudent = dbCall.dbResult[0]
    * print dbStudent.FULL_NAME
  # Compare values
#    * match apiStudent.fullName == dbStudent.FULL_NAME
#    * match apiStudent.email == dbStudent.EMAIL
#    * match apiStudent.cgpa == dbStudent.CGPA
