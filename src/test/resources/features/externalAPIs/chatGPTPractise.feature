Feature: solve chatgpt practise problems

  Scenario: 1 GET users and apply regex
    Given url 'https://reqres.in/api/users?page=2'
    When method get
    Then status 200
    And print response
    And match response.data[*].email contains 'michael.lawson@reqres.in'
    And match each response.data[*].email contains '#regex .*@reqres.in'

  Scenario: 2 create user
    Given url 'https://reqres.in/api/users'
    And header x-api-key = 'reqres-free-v1'
    And request { "name": "Rajesh", "job": "QA" }
    When method post
    And status 201
    And print response
    And match $.name == 'Rajesh'
    And match $.id == '#notnull'

  Scenario: 3 update job title
    Given url 'https://reqres.in/api/users/2'
    And header x-api-key = 'reqres-free-v1'
    And request { "name": "Rajesh", "job": "Senior QA" }
    When method put
    Then status 200
    And print response
    And match response.job == 'Senior QA'


  Scenario: 4 schema validations
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And print response
    * def schema =
    """
    {
    id: '#number',
    email: '#string',
    first_name: '#string',
    last_name: '#string',
    avatar: '#string'
    }
    """
    And match response.data == schema

   Scenario Outline: 5 resue token

     Given url 'https://reqres.in/api/login'
     And header x-api-key = 'reqres-free-v1'
     And request { "email": '<username>', "password": '<password>' }
     When method post
     Then status 200
     And print response
     * def token = response.token
     And print token
     Examples:
     |username|password|
     |eve.holt@reqres.in |cityslicka|
#     | peter@klaven      | test123  |

#     And header Authorization = 'Bearer ' + token

#   Scenario: 6