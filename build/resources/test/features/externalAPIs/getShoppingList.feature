@ignore
Feature: Test shopping site
          using another demo site

  Scenario: get all products list

    Given url shoppingCartAPI
    And path 'productsList'
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And print response
    And match $.responseCode == 200
    And match $.responseCode == '#number'
    And match $.products == '#[]'
    And print responseTime
    And match each response.products == {id: '#number',name: '#string',price: '#string',brand: '#string',category: {usertype: { usertype: '#string' },category: '#string'}}
    And match each response.products contains { id: '#number', name: '#string' }
    * match response.products[*].id contains 5
    * match response.products[*].id contains [1, 2, 3]
    * match response.products[*].category.category contains 'Jeans'
    * match response.products[*].category.category contains 'Tshirts'

