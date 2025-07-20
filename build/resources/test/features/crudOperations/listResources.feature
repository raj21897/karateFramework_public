Feature: This is to check list of resources

  Scenario: This is single resource list

    Given url baseAppUrl
    And path 'api/unknown','2'
    And header x-api-key = 'reqres-free-v1'
    When method get
    Then status 200
    And print response


  Scenario Outline: This is to get  resource list

    Given url baseAppUrl
    And path 'api/unknown','<userNumber>'
    And header x-api-key = 'reqres-free-v1'
    When method get
    Then status <responseCode>
    And print response
#    And match response.data.id == <userNumber>

    Examples:
      | userNumber |responseCode|
      | 3          |200         |
      | 5          |200         |
      |50          |404         |