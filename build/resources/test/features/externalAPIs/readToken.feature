Feature: read toke file

  Scenario: call token from another feature file


    * def token1 =  call read("classpath:features/externalAPIs/tokenGenerate.feature") { a : 30, b : 20 }
    * print token1.token
    * print token1.a
    * print 'this is end of script'
    * def sum = token1.a + token1.b
    * print sum
    * print token1.sum1
    * print token1.sum2
