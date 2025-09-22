Feature: var demo

  Background:
#    * configure retry = {count:3,interval:1000}
  Scenario: test different var scenario
    Given  def myVar = "rajesh"
    And def dob = 210897
    Then print 'my date of birth is = ', myVar+dob
    And assert myVar+dob == 'rajesh210897'
#    * print retry
    * def db = DbUtils
    * print DbUtils