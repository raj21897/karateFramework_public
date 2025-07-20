Feature: Data Driven testing

  Scenario Outline: To try different scenarios with data driven approach using example table

    Given print "the first variable value==>",<var1>
    Then print "the second variable value==>",<var2>

    Examples:
    |var1|var2|
    |2   |3   |

  Scenario Outline: To try different scenarios with data driven approach using csv file

    Given print "the third variable value==>",<var3>
    Then print "the foruth variable value==>",'<var4>'

    Examples:
    |read('TestData.csv')|