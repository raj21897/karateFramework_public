package runner;

import com.intuit.karate.Runner.Builder;
import org.junit.jupiter.api.Test;

public class ParellelRunnerWithCucumberReport {

        @Test
        public void executeKaratetest()
        {
            Builder aRunner = new Builder();
            aRunner.path("classpath:features");
            aRunner.parallel(5);

        }

        private void generateCucumberReport(){

        }
}
