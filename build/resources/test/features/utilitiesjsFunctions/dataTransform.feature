Feature: Data tarnsform using js

  Background:
   * def transforuser =
    """
    function(user){
    return{
    fullName : user.firstName + ' '+user.lastName,
    email: user.email.toLowerCase()
    };}
    """

 Scenario Outline: data tranform using js function

    * def rawdata = {firstName : <firstName>, lastName : <lastName>,email: <email>}
    * def trdata = transforuser(rawdata)
    * print trdata

    Examples:n
   |firstName|lastName   |email         |
   | Rajesh  | Choudhari |ABC@gmail.com |
   | Raj     | Choudhari |xyz@gmail.com |





