
 Feature: to get list of single user fromserver

   Scenario: to get single user

     Given url baseAppUrl
     And path 'api','users','2'
     And  header x-api-key = 'reqres-free-v1'
     When method GET
     Then status 200
     And print response

