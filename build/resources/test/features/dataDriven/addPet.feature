Feature: Add pet store new API

  Scenario: Trying to do data driven using add pet store api

    Given url 'https://petstore.swagger.io/v2'
    And path 'pet'
    And header Content-Type = 'application/json'
    * def petName  = Math.random().toString(36).substring(2, 10)
    * print petName
    * def randomID = Math.floor(Math.random()*100)
    * print randomID
    * def requestbody =
                        """
                        {
                      "id": 0,
                      "category": {
                        "id": '#(randomID)',
                        "name": '#(petName)'
                      },
                      "name": "doggie",
                      "photoUrls": [
                        "string"
                      ],
                      "tags": [
                        {
                          "id": 0,
                          "name": "string"
                        }
                      ],
                      "status": "available"
                    }
                        """
    And request requestbody
    And print requestbody
    When method POST
    Then status 200
    And print response