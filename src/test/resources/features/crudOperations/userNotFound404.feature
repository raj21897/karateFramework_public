
 Feature: to 404 user not found response

   Scenario: to get user not found 404

     Given url baseAppUrl
     And path 'api','users','100'
     And  header x-api-key = 'reqres-free-v1'
     When method GET
     Then status 404
     And print response




     