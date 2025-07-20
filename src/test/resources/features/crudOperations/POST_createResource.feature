Feature: POST request


  Scenario: to create user using post request
    Given url baseAppUrl
    And path 'api/users'
    And header x-api-key = 'reqres-free-v1'
    And header Content-Type = 'application/json'
    And request { "name": "Rajesh","job": "QA"}
    When method POST
    Then status 201
    And print response
    And match response.name == 'Rajesh'
    And match response.job == 'QA'
    * def user = response.id
    * print user


    Given url baseAppUrl
    And path 'api/users',user
    And header x-api-key = 'reqres-free-v1'
    When method GET
    Then status 404
    And print response
    And def v1 = 10
    And def v2 = "Rajesh"




