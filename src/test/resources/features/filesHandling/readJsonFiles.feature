Feature: Complex json files

  Scenario: Complex json validations

    * def payload =  read('classpath:features/filesHandling/exampleJson.json')
    * print payload
    * match payload.company.products[*] contains {"id": "P001", "name": "AI Assistant", "version": "2.0"}
    * match payload.company.products[*].id contains [P001,P002]
    * def len =  payload.company.products
    * print len.length
    * def id1 = payload.company.products[0].id
    * print id1
    * match payload.company.products[1].id == "P002"
    * match each payload.company.products[*].id == '#regex ^P\\d+$'
    * match each payload.company.products[*].id == '#regex ^P\\d{3}$+'

