Feature: Validate student ID with DB


  Background:
    * def studentId = 2
    * def DbQueries = karate.get('DbQueries')
    * def query = DbQueries.getStudentById(studentId)
    * def dbCall = call read('classpath:features/database/dbconnect.feature') { query: '#(query)' }


  Scenario: fetch response from APi and validate with DB

    Given url baseUrl
    And path 'api/users',studentId
    And header x-api-key = 'reqres-free-v1'
    When method GET
    Then status 200
    And print response
    * def apiStudentID = $.data.id
    * print apiStudentID
    And match $.data.id == studentId
#    * def dbCall = call read('classpath:features/database/dbconnect.feature') { query: '#(query)' }
    * print dbCall.result
    * def dbStudentID = dbCall.result[0].STUDENT_ID
    * print dbStudentID
    * match apiStudentID == dbStudentID
    * match dbCall.result[0].STUDENT_ID == studentId
    * print 'both student ids are matched','api id ->',apiStudentID,'db student id ->',dbStudentID