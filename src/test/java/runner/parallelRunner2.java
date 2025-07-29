package runner;


import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;


public class parallelRunner2 {

    @Test
    public  void excuteKarateTests(){

        Runner.path("classpath:features/dataDriven/runner.feature").parallel(50);

    }
}
