Feature: POST request


  Scenario: to create user using post request
    Given url baseAppUrl
    And path 'api/users'
    And header x-api-key = 'reqres-free-v1'
    And header Content-Type = 'application/json'
    And request { "name": '#(name)',"job": "QA"}
    When method POST
    Then status 201
    And print response



