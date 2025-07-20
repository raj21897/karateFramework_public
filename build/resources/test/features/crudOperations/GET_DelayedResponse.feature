Feature: Delayed response feature

  Scenario: Delay in response scenario
    Given url baseAppUrl
    And path 'api','users'
    And param delay = 5
    And  header x-api-key = 'reqres-free-v1'
    When method GET
    Then status 200