Feature: This is patch request

  Scenario: to check patch request

# to create user
    Given url baseAppUrl
    And path 'api/users'
    And header x-api-key = 'reqres-free-v1'
    And header Content-Type = 'application/json'
    And request { "name": "rajesh","job": "QA"}
    When method POST
    Then status 201
    And print response
    And match response.name == 'rajesh'
    And match response.job == 'QA'

    # to update user data using patch
    Given url baseAppUrl
    And path 'api/user','2'
    And header x-api-key = 'reqres-free-v1'
    And request { "name": "rajesh","job": "QA Automation"}
    When method PATCH
    Then status 200
    And print response

  # update data using PUT request
    Given url baseAppUrl
    And path 'api/user','2'
    And header x-api-key = 'reqres-free-v1'
    And request { "name": "rajesh choudhari","job": "QA Automation"}
    When method PUT
    Then status 200
    And print response


