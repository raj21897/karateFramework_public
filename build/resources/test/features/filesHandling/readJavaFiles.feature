Feature: Read java files

  Background:

  Scenario: Try to read Java functions from classes

    * def CommonJava = Java.type('utils.commonJavaFunctions')
    * def common = new CommonJava()
    * def result = common.sum(5, 7)
    * print 'Sum:', result
    * match result == 12
#    using static method
    * def s = CommonJava.summ(10,20)
    * print s
    *  eval CommonJava.printDbUser(dbUser)
    *  eval CommonJava.printDbUser("I am Rajesh user manually from feature file")


