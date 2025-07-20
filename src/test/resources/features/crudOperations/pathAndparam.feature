Feature: This is demo1 feature


  Background:
    * def baseurl = 'https://reqres.in/'

  Scenario: Scenarios1 from demo1
    # to demonstrate use of path and param
    Given url baseurl
    And path '/api/users'
    And param page = 2
    And  header x-api-key = 'reqres-free-v1'
    When method GET
    Then status 200
    And print response
    # method to use baseurl from karate-config.js file
    Given url baseAppUrl
    And path 'api' , 'users'
    And param page = 2
    And  header x-api-key = 'reqres-free-v1'
    When method GET
    Then status 200
    And print response