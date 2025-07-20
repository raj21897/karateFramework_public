Feature: Explore Embedded expressions

  Background:
    * header x-api-key = 'reqres-free-v1'

  Scenario: Embedded Expression
    Given url baseAppUrl
    And path 'api/users'
    * def randStr = Math.random().toString(36).substring(2, 10)
    * def str = randStr
    * print 'randStr ==>',randStr,'str ==>>',str
    * def body =
    """
    {
    "name": "#(randStr)",
    "job": "leader"
    }
    """
    And request body
    And print body
    When method post
    Then status 201
    And print response
    * def rand = Math.random().toString(36).substring(2, 10)
    * print 'Short Random:', rand
    * def randStr = Math.random().toString(36).substring(2, 10)
    * def email = 'user.' + randStr + '@test.com'
    * print email

