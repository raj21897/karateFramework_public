Feature: Reqres API Test Scenarios with Different HTTP Methods

  Background:
    * url 'https://reqres.in'
    * header x-api-key = 'reqres-free-v1'
    * header Content-Type = 'application/json'

  @get
  Scenario: GET list of users
    Given path 'api', 'users'
    And param page = 2
    When method GET
    Then status 200
    And match response.data != null

  @post
  Scenario: POST - Create a new user
    * def requestBody =
      """
      {
        "name": "Raj",
        "job": "QA Engineer"
      }
      """
    Given path 'api', 'users'
    And request requestBody
    When method POST
    Then status 201
    And match response.name == "Raj"

  @put
  Scenario: PUT - Update user information
    * def updateBody =
      """
      {
        "name": "Raj Updated",
        "job": "Senior QA"
      }
      """
    Given path 'api', 'users', 2
    And request updateBody
    When method PUT
    Then status 200
    And match response.name == "Raj Updated"

  @patch
  Scenario: PATCH - Partially update user
    * def patchBody =
      """
      {
        "job": "Lead QA"
      }
      """
    Given path 'api', 'users', 2
    And request patchBody
    When method PATCH
    Then status 200
    And match response.job == "Lead QA"

  @delete
  Scenario: DELETE - Delete user
    Given path 'api', 'users', 2
    When method DELETE
    Then status 204
