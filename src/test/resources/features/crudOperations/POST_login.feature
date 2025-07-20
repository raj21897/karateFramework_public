Feature: Successful login


  Scenario: Successful login scenario

    Given  url baseAppUrl
    And path 'api/login'
    And header x-api-key = 'reqres-free-v1'
    And header Content-Type = 'application/json'
    And request {"email":"eve.holt@reqres.in","password":"pistol"}
    When method POST
    Then status 200
    And print response