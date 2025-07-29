Feature: Call add-pet.feature 100 times

  Scenario: Loop to add pets
    * def i = 0
    * def loop =
    """
    function(){
      for (var i = 0; i < 5; i++) {
        karate.call('classpath:features/dataDriven/addPet.feature');
      }
    }
    """
    * eval loop()
