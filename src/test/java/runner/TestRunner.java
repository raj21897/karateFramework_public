package runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate runTest() {
     return Karate.run("classpath:features/database/dbRunquery.feature");
    }
}
