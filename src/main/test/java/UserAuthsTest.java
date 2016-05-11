import dao.UserAuthsDAO;
import domain.UserAuthsDO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import service.UserAuthsService;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by tqy on 16/4/6.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserAuthsTest {
    @Resource
    UserAuthsService userAuthsService;


    @Test
    public void getMailsTest(){
        System.out.println(userAuthsService.getMails());
    }

    @Test
    public void getByName(){
        UserAuthsDO userAuthsDO = userAuthsService.getByName("test2");
        System.out.println(userAuthsDO);
    }

}
