Feature: unSuccessful Registration


  Scenario: unSuccessful registration scenario due to missing password

    Given  url baseAppUrl
    And path 'api/register'
    And header x-api-key = 'reqres-free-v1'
    And header Content-Type = 'application/json'
    And request {"email":"eve.holt@reqres.in"}
    When method POST
    Then status 400
    And print response
    And match response.error == "Missing password"

  Scenario: unSuccessful login scenario due to missing password
    Given  url baseAppUrl
    And path 'api/login'
    And header x-api-key = 'reqres-free-v1'
    And header Content-Type = 'application/json'
    And request {"email":"eve.holt@reqres.in"}
    When method POST
    Then status 400
    And print response
    And match response.error == "Missing password"