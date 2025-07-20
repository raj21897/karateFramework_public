Feature: explore js functions

  Scenario: JS functions

    Then def newFunction = function(){return 10}
    And print "above function value  ==>",newFunction()
    Then def getInt = function(arg1){return arg1}
    And print "above function value  ==>",getInt(50)
    Then def getString = function(arg1){return "hello " +arg1}
    And def name = getString("rajesh")
    And print name
    And print "above function value  ==>",getString("rajesh")