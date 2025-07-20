package runner;

import com.intuit.karate.junit5.Karate;

public class TestRunnerwithTags {

    @Karate.Test
    Karate runWithTags() {
       return Karate.run("classpath:features")
               .tags("@rajesh")
               .relativeTo(getClass());
    }

}
