Feature: var demo

  Scenario: test different var scenario
    Given  def myVar = "rajesh"
    And def dob = 210897
    Then print 'my date of birth is = ', myVar+dob
    And assert myVar+dob == 'rajesh210897'