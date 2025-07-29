Feature: Create new user using POST request

  Scenario: Create user with all required parameters

    Given url 'https://automationexercise.com/api/createAccount'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And form field name = 'Rajesh'
    And form field email = 'rajesh123456@example.com'
    And form field password = 'Test@123'
    And form field title = 'Mr'
    And form field birth_date = '27'
    And form field birth_month = '07'
    And form field birth_year = '1995'
    And form field firstname = 'Rajesh'
    And form field lastname = 'Choudhari'
    And form field company = 'OpenAI'
    And form field address1 = '123 Main St'
    And form field address2 = 'Apt 4B'
    And form field country = 'India'
    And form field zipcode = '411001'
    And form field state = 'Maharashtra'
    And form field city = 'Pune'
    And form field mobile_number = '9876543210'
#    When method post
#    Then status 200
#    And match response contains 'User created!'
#    And print response
