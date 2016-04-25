import org.apache.log4j.Logger;
import org.junit.Test;
import us.codecraft.webmagic.Spider;
import webmagic.GithubRepoPageProcessor;

import java.io.IOException;
import java.sql.SQLException;

import static com.sun.webpane.platform.ConfigManager.log;

/**
 * Created by tqy on 16/4/25.
 */
public class WebMagicTest {
    @Test
    public void webmagicTest() {
        Spider.create(new GithubRepoPageProcessor()).addUrl("https://github.com/code4craft").thread(5).run();
    }

    @Test
    public void Log4j() {
        Logger log = Logger.getLogger(WebMagicTest.class.getName());

        log.debug("Hello this is a debug message");
        log.info("Hello this is an info message");

    }
}
