#Feature: H2 Database Connection
#
#  Background:
#    * def DbUtils = Java.type('utils.DbUtils')
## if you dont define connection details in config filethen add here
##    * def config =
##    """
##    {
##      url: 'jdbc:h2:file:~/test;AUTO_SERVER=TRUE',
##      user: 'sa',
##      password: ''
##    }
##    """
#    # if u define in config file
#    * def config = db
#    * def conn = DbUtils.connect(config.url, config.user, config.password)

#  Scenario: Run a SELECT query
#    * def rs = DbUtils.executeQuery("SELECT * FROM STUDENTS")
#    * print rs
#    * def result = DbUtils.rows(rs)
#    * print result

#  Scenario: Run an INSERT query from feature files
#    * def count = DbUtils.executeUpdate("INSERT INTO STUDENTS (STUDENT_ID, FULL_NAME, EMAIL, DOB, BRANCH, IS_ACTIVE, CGPA) VALUES (5, 'Vikas Deshmukh', 'vikas.deshmukh@example.com', '1997-11-05', 'Information Technology', TRUE, 8.55)")
#    * print 'Rows affected:', count
#    * match count == 1

#  Scenario: Run an INSERT query from SQL files
#    * def insertBytes = read('classpath:sqlQueries/insert_students.sql')
#    * def insertQuery = new java.lang.String(insertBytes)  # ✅ Proper conversion from byte[] to String
#    * def count = DbUtils.executeQuery(insertQuery)
#    * print 'Rows inserted:', count
#    * match count == 1




#  Scenario: Close DB Connection
#    * eval DbUtils.closeConnection()

#Feature: DB Query Executor
#
#  Background:
#    * def DbUtils = Java.type('utils.DbUtils')
#    * def dbUrl = karate.get('dbUrl')
#    * def dbUser = karate.get('dbUser')
#    * def dbPassword = karate.get('dbPassword')
#
#  Scenario: Execute dynamic DB query
#  # 'query' must be passed as argument
#    * def result = DbUtils.runQuery(query, dbUrl, dbUser, dbPassword)
##    * def dbResult = result
#

Feature: DB Query Executor

  Scenario: Execute dynamic DB query
    * def DbUtils = Java.type('utils.DbUtils')
    * def result = DbUtils.runQuery(query, dbUrl, dbUser, dbPassword)
#    * def result = DbUtils.runQuery(query, 'jdbc:h2:~/test', 'sa', '')
    * print result
