@rajesh

Feature: to check delete request working
@rajesh
  Scenario: verify DELETE request

    Given  url baseAppUrl
    And path 'api/users/2'
    And header x-api-key = 'reqres-free-v1'
    When method delete
    Then status 204
    And print response
