Feature: Handle csv file

  Scenario: CSV reading data adn print

    * def csvdata  = read("classpath:features/filesHandling/example.csv")
    * print csvdata
    * def u1 =  csvdata[0].username
    * print u1

  Scenario Outline: try multiple sets of data and print

    * print 'username:', '#(<username>)'
    * print 'password:', '#(<password>)'
    * print 'city:', '#(<city>)'
    * print 'job:', '#(<job>)'
    * print 'adult:', '#(<adult>)'

#    * print 'username:', <username>
#    * print 'password:', <password>
#    * print 'city:', <city>
#    * print 'job:', <job>
#    * print 'adult:', <adult>

    Examples:
      | read("classpath:features/filesHandling/example.csv") |

