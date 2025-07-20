Feature: test calling feature file from another

  Scenario: Test calling another feature file from here


    Given call read('classpath:features/crudOperations/CRUD_allrequests.feature')
    Then print 'scenario completed'


    Scenario: calling another feature file and change and access varibles

      Given call read('classpath:features/crudOperations/POST_createResource_helper.feature'){name:"rajeshchoudhari"}



     Given def f1 = call read('classpath:features/crudOperations/POST_createResource.feature')
     And print f1.v1, f1.v2
