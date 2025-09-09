Feature: Variables Demo

  Background:
    * def varible2 = "varible2 value"

  Scenario: Variables scope
    * print variable1
    * print varible2
    * def varible2 = "new update variable2 value"
    * print varible2
    * def var3 = 5
    * eval if(var3 == 5) karate.set('variable1' , "new var1 value")
    * print variable1
    * print flag1
    * karate.set("flag1",'"false"')
    * print flag1
    * karate.set("flag1","'false'")
    * print flag1
    * karate.set("flag1",false)
    * print flag1

    * def randomEmail = 'user' + java.util.UUID.randomUUID() + '@test.com'
    * print randomEmail
    * def currentTime = new Date().getTime()
    * print currentTime
