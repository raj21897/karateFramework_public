
 Feature: to get list of single user fromserver

   Scenario Outline: to get multiple users through examples

     Given url baseAppUrl
     And path 'api','users','<userNumber>'
     And  header x-api-key = 'reqres-free-v1'
     When method GET
     Then status 200
     And print response

     Examples:
     |userNumber|
     |2|
     |3|
     |10|

     