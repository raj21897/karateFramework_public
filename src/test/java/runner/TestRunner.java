package runner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate runTest() {
//       return Karate.run("C:/Users/beori/IdeaProjects/project - Copy/src/test/java/features/crudOperations");
//        return Karate.run("classpath:features/pathAndparam.feature");
//        return Karate.run("C:/Users/beori/IdeaProjects/project - Copy/src/test/java/features/methods");
        return Karate.run("classpath:features/crudOperations/PATCH_update.feature");


    }
}
