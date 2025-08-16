Feature: User Management Workflow

 
  Scenario: Complete user lifecycle
  # Create user
    Given url 'https://reqres.in/api/users'
    * headers headers
    And request { "name": "Test User", "job": "QA" }
    When method POST
    Then status 201
    And print response
    * def userId = response.id

  # Update user
    Given url 'https://reqres.in/api/users/' + userId
    * headers headers
    And request { "name": "Updated User", "job": "Senior QA" }
    When method PUT
    Then status 200
    And print response

  # Delete user
    Given url 'https://reqres.in/api/users/' + userId
    * headers headers
    When method DELETE
    Then status 204
    And print response
